package com.ibk.itep.controller.cmm;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ibk.itep.common.file.FileUtil;
import com.ibk.itep.common.file.FileVo;

@Controller
public class FileDownloadController{
	
	private static final Logger logger = LoggerFactory.getLogger(FileDownloadController.class);

	@Autowired
	FileUtil fileUtil;
	
	/*테스트용 추후 삭제 대상 시작*/
	@RequestMapping(value = "/updateFile", method = RequestMethod.POST )
	public String update(Model model,
			@RequestParam("fileNoDel[]") int[] fileNoDel,
			MultipartHttpServletRequest mpRequest) {
		logger.debug(String.valueOf(fileNoDel.length));
		fileUtil.fileUpdate(fileNoDel,"공지사항",10,mpRequest);
		return "selectFileList";
	}
	
	@RequestMapping(value = "/selectFileList", method = RequestMethod.GET )
	public String readView(Model model) {
		List<FileVo> fileVoList = fileUtil.selectFileList("공지사항", 10);
		if(fileVoList != null) {
			if(!fileVoList.isEmpty()) {
				logger.debug(fileVoList.get(0).getOrg_file_name());
				logger.debug(fileVoList.get(0).getFile_size().toString());
				model.addAttribute("fileVoList",fileVoList);
			}
		}	
		return "selectFileList";
	}
	
	@RequestMapping(value = "/writeView", method = RequestMethod.GET )
	public String writeView() {
		return "writeView";
	}
	
	@RequestMapping(value = "/form2", method = RequestMethod.GET )
	public String form2() {
		return "form2";
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST )
	public String upload(
			Model model,
			@RequestParam("code_nm") String code_nm,
			@RequestParam("pbns_id") int pbns_id,
			MultipartHttpServletRequest mpRequest) {

		int uploadCounnt = fileUtil.fileUpload(code_nm, pbns_id, mpRequest);
		logger.debug("upload file count : " + String.valueOf(uploadCounnt));
		return "form2";
	}
	/*테스트용 추후 삭제 대상 끝*/
	
	@RequestMapping(value = "/views/cmm/fileDownload", method = RequestMethod.POST)
	public void fileDownload(@RequestParam(value="file_no", required=false) int file_no, HttpServletResponse response) {
		logger.debug(String.valueOf(file_no));
		FileVo fileVo = fileUtil.fileDownload(file_no);
		String storedFileName = fileVo.getStored_file_name();
		String originalFileName = fileVo.getOrg_file_name();
		String upload_path = fileVo.getUpload_path();
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = null ;
		try {
			fileByte = org.apache.commons.io.FileUtils.readFileToByteArray(new File(upload_path+ storedFileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		
		try {
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}








