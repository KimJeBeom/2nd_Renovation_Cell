package com.ibk.itep.common.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileUtil {
	
	@Value("${file.path}")
	private String SAVE_PATH;
	
	private static final Logger logger = LoggerFactory.getLogger(FileUtil.class);
	
	@Autowired
	private FileDao fileDao;
	private String upload_path = null;
	
	public void fileUpdate(int[] fileNoDel, String code_nm, int pbns_id, MultipartHttpServletRequest mpRequest) {
		
		if(fileNoDel.length !=0 ) {
			logger.debug("file update count : " + String.valueOf(fileNoDel.length));
			fileDao.updateFile(fileNoDel);
			for(int fileNoDel1 : fileNoDel) {
				FileVo fileVo =fileDao.selectFileInfo(fileNoDel1);
				String delfile = fileVo.getUpload_path() + fileVo.getStored_file_name();
				File file = new File(delfile);
				if(file.exists()) {
					file.delete();
					logger.debug(delfile + "삭제완료");
				}else
					logger.debug(delfile + "파일이 없어, 삭제 실패");
			}
			/*for(int fileNoDel1 : fileNoDel) {
				fileDao.updateFile(fileNoDel1);
			}*/
		}
		if(mpRequest != null) {
			Iterator<String> iterator = mpRequest.getFileNames();
			MultipartFile multipartFile = mpRequest.getFile(iterator.next());
			if(!multipartFile.getOriginalFilename().isEmpty()) {
				logger.debug("file update code_nm : " + code_nm);
				logger.debug("file update pbns_id : " + pbns_id);
				logger.debug("file update size : " + multipartFile.getOriginalFilename().isEmpty());
				fileUpload(code_nm, pbns_id, mpRequest);
			}
		}
	}
	
	public FileVo fileDownload(int file_no) {
		logger.debug(String.valueOf(file_no));
		return fileDao.selectFileInfo(file_no);
	}
	
	public List<FileVo> selectFileList(String code_nm, int pbns_id) {
		FileVo fileVo = new FileVo();
		fileVo.setCode_nm(code_nm);
		fileVo.setPbns_id(pbns_id);
		return fileDao.selectFileList(fileVo);
	}
	
	public int fileUpload(String code_nm, int pbns_id, MultipartHttpServletRequest mpRequest) {
		String originFilename = null;
		String extName = null;
		List<FileVo> fileVoList = new ArrayList<FileVo>();
		
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null;
		try {
			while(iterator.hasNext()) {
				multipartFile = mpRequest.getFile(iterator.next());
				if(multipartFile.isEmpty() == false) {
					FileVo fileVo = new FileVo();
					// 파일 정보
					originFilename = multipartFile.getOriginalFilename();
					extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
					Long size = multipartFile.getSize();
					// 서버에서 저장 할 파일 이름
					String saveFileName = genSaveFileName(extName);
					
					logger.debug("originFilename : " + originFilename);
					logger.debug("extensionName : " + extName);
					logger.debug("size : " + size);
					logger.debug("saveFileName : " + saveFileName);
					
					writeFile(multipartFile, saveFileName);
					
					fileVo.setOrg_file_name(originFilename);
					fileVo.setStored_file_name(saveFileName);
					fileVo.setFile_size(size);
					fileVo.setCode_nm(code_nm);
					fileVo.setPbns_id(pbns_id);
					fileVo.setUpload_path(upload_path);
					fileVoList.add(fileVo);
				}
			}
		}catch (IOException e) {
			throw new RuntimeException(e);
		}
		return fileDao.insertFile(fileVoList);
	}
	
	public int fileUpload(String code_nm, int pbns_id, List<MultipartFile> multipartFile) {
		String originFilename = null;
		String extName = null;
		List<FileVo> fileVoList = new ArrayList<FileVo>();
		
		try {
			for (MultipartFile multipartFile2 : multipartFile) {
				FileVo fileVo = new FileVo();
				// 파일 정보
				originFilename = multipartFile2.getOriginalFilename();
				extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
				Long size = multipartFile2.getSize();
				// 서버에서 저장 할 파일 이름
				String saveFileName = genSaveFileName(extName);
				
				logger.debug("originFilename : " + originFilename);
				logger.debug("extensionName : " + extName);
				logger.debug("size : " + size);
				logger.debug("saveFileName : " + saveFileName);
				
				writeFile(multipartFile2, saveFileName);
				
				fileVo.setOrg_file_name(originFilename);
				fileVo.setStored_file_name(saveFileName);
				fileVo.setFile_size(size);
				fileVo.setCode_nm(code_nm);
				fileVo.setPbns_id(pbns_id);
				fileVo.setUpload_path(upload_path);
				fileVoList.add(fileVo);
			}
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		return fileDao.insertFile(fileVoList);
	}
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		Calendar calendar = Calendar.getInstance();
		String filename = sdf.format(calendar.getTime());
		logger.debug("날짜시간 : "+filename);
		filename += extName;
		logger.debug("파일명 : "+filename);
		
		return filename;
	}

	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName)
								throws IOException{
		boolean result = false;
		logger.debug(getFolder());
		upload_path = File.separator + getFolder() + File.separator;
		// make folder ----------
		File uploadPath = new File(upload_path);
		logger.info("upload path : " + uploadPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(upload_path + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
	}
	
	// 오늘 날짜의 경로를 문자열로 생성한다.
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar calendar = Calendar.getInstance();
		String str = sdf.format(calendar.getTime());
		str = SAVE_PATH + File.separator + str;
		logger.debug("folder path : " + str);
		return str;
	}
}
