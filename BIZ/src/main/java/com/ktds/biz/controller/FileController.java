package com.ktds.biz.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ktds.biz.model.AIPredict;
import com.ktds.biz.model.AI_CAMPAIGN;
import com.ktds.biz.model.AI_PAGE;
import com.ktds.biz.model.AI_STAGING;
import com.ktds.biz.service.CampaignService;
import com.ktds.biz.service.PredictService;
import com.ktds.biz.service.StagingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/file")
public class FileController {
	private String baseDir = "/home/jji5636/CSV_DATA" + File.separator; // D:\temp 디렉토리를 미리 만들어둔다.

	@Autowired
	CampaignService campaignService;

	@Autowired
	PredictService predictService;

	@Autowired
	StagingService stagingService;

	@RequestMapping(value = "/Upload_Pretreatment")
	public ResponseEntity<Object> fileUpload_Pretreatment(String user_id, //
			String inputCamName, String inputCamDesc, String cam_type, String cam_autoyn, MultipartFile[] file_train,
			MultipartFile[] file_test) {
		AI_CAMPAIGN campaign = new AI_CAMPAIGN();
		//AI_CAMPAIGN campaign = campaignService.selectCampaignSeq();
		campaign.setAdm_id(user_id);
		campaign.setSrc_name(inputCamName);
		campaign.setDesc_text(inputCamDesc);
		campaign.setSrc_type(cam_type);
		campaign.setCam_autoyn(cam_autoyn);

			MultipartFile file_t1 = file_train[0];
		long size_t1 = file_t1.getSize();
		MultipartFile file_t2 = file_test[0];
		long size_t2 = file_t2.getSize();

		if (size_t1 == 0 || size_t2 == 0) {
			return new ResponseEntity<Object>("FAIL::학습파일/대상자 파일은 필수 입니다.", HttpStatus.OK);
		} else {
			String uuid = UUID.randomUUID().toString(); // 중복될 일이 거의 없다.
			String fullPath = checkAndMakeBaseDir(user_id);
			String fileName1 = uuid + "_" + campaign.getAdm_id() + "_"+ file_t1.getName();
			String saveFileName_t1 = fullPath + File.separator + fileName1;
			
			saveFile(file_t1, saveFileName_t1);

			String fileName2 = uuid + "_" + campaign.getAdm_id() + "_"
					+ file_t2.getName();
			String saveFileName_t2 = fullPath + File.separator +fileName2; 
			campaign.setCam_ofilename(saveFileName_t2);
			campaign.setCam_otype("1");
			saveFile(file_t2, saveFileName_t2);

			campaign.setFile_t_type("TRAIN");
			
			campaign.setFile_t_name(fileName1);
			campaign.setFile_dir(fullPath);
			campaign.setFile_p_type("PREDICT");
			campaign.setFile_p_name(fileName2);
			campaignService.insertCampaign(campaign);
			return new ResponseEntity<Object>("OK::등록 성공", HttpStatus.OK);
		}
	}

	@RequestMapping(value = "/Upload_StagingTest")
	public ResponseEntity<Object> fileUpload_StagingTest(String user_id, //
			String inputCamId, String cam_autoyn,MultipartFile[] file_train, MultipartFile[] file_test) {
		AI_CAMPAIGN inCampaign = new AI_CAMPAIGN();
		inCampaign.setSrc_id(inputCamId);
		//inCampaign.setCam_seq(inputCamId);
		AI_CAMPAIGN campaign = campaignService.selectCampaignAiStatus(inCampaign);
		int targetFlag = 0;	//등록된 파일에 따라 호출 api 변경 처리(학습파일등록:1, 예측파일등록:2)
		MultipartFile file_t1 = file_train[0];
		long size_t1 = file_t1.getSize();
		
		MultipartFile file_t2 = file_test[0];
		long size_t2 = file_t2.getSize();

		if (size_t1== 0 && size_t2 == 0) {
			return new ResponseEntity<Object>("FAIL::학습파일/대상자 파일은 필수 입니다.", HttpStatus.OK);
		} else {
			//예측 파일만 등록한 경우
			if(size_t1 == 0) 
			{
			
				String uuid = UUID.randomUUID().toString();
				String fullPath = checkAndMakeBaseDir(user_id);
				String fileName2 = uuid + "_" + campaign.getAdm_id() + "_"+ file_t2.getName();
				String saveFileName_t2 = fullPath + File.separator + fileName2;
				campaign.setCam_ofilename(saveFileName_t2);
				campaign.setFile_p_type("PREDICT");
				saveFile(file_t2, saveFileName_t2);
				campaign.setFile_p_name(fileName2);
				campaignService.updateCampaignPType(campaign);
				targetFlag = 2;
			}
			//학습 파일만 등록한 경경우
			else if(size_t2 ==0)
			{
				String uuid = UUID.randomUUID().toString();
				String fullPath = checkAndMakeBaseDir(user_id);
				String fileName1 = uuid + "_" + campaign.getAdm_id() + "_"+ file_t1.getName();
				String saveFileName_t1 = fullPath + File.separator + fileName1;
				
				campaign.setCam_ofilename(saveFileName_t1);
				campaign.setFile_t_type("TRAIN");
				saveFile(file_t1, saveFileName_t1);
				campaign.setFile_t_name(fileName1);
				campaignService.updateCampaignTType(campaign);
				targetFlag = 1;
			}
			//학습파일 예측파일 둘다 등록될 경우 flag는 1로 세팅된다.
			else {
				String uuid = UUID.randomUUID().toString(); // 중복될 일이 거의 없다.
				String fullPath = checkAndMakeBaseDir(user_id);
				String fileName1 = uuid + "_" + campaign.getAdm_id() + "_"+ file_t1.getName();
				String saveFileName_t1 = fullPath + File.separator + fileName1;
				
				saveFile(file_t1, saveFileName_t1);

				String fileName2 = uuid + "_" + campaign.getAdm_id() + "_"
						+ file_t2.getName();
				String saveFileName_t2 = fullPath + File.separator +fileName2; 
				campaign.setCam_ofilename(saveFileName_t2);
				campaign.setCam_otype("1");
				saveFile(file_t2, saveFileName_t2);

				campaign.setFile_t_type("TRAIN");
				
				campaign.setFile_t_name(fileName1);
				campaign.setFile_dir(fullPath);
				campaign.setFile_p_type("PREDICT");
				campaign.setFile_p_name(fileName2);
				campaignService.updateCampaignAllType(campaign);
				targetFlag = 1;
			}
			return new ResponseEntity<Object>("OK::등록 성공::"+campaign.getSrc_id()+"::"+targetFlag, HttpStatus.OK);
		}
	}

	@RequestMapping(value = "/downloadGuide")
	public ResponseEntity<byte[]> downloadGuideFile() throws Exception {
		String GuideFile = "/home/jji5636/AIGuide/AI_CRMMarketingPlatform.pdf";
		Path path = Paths.get(GuideFile);
		byte[] array = Files.readAllBytes(path);
		String fileName = "inline; filename=AI_CRMMarketingPlatform.pdf";
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.set("charset", "utf-8");
		responseHeaders.setContentType(MediaType.parseMediaType("application/pdf"));
		responseHeaders.setContentLength(array.length);
		responseHeaders.set("Content-disposition", fileName);
		ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(array, responseHeaders, HttpStatus.OK);
		return response;
	}

	

	@RequestMapping(value = "/UploadReal")
	public ResponseEntity<Object> fileUpload_Real(String cam_id, String user_id, //
			MultipartFile[] file_real, HttpSession session) {
		AI_CAMPAIGN campaign = new AI_CAMPAIGN();
		campaign.setSrc_id(cam_id);
		campaign.setCam_seq(cam_id);

		MultipartFile file_t1 = file_real[0];
		long size_t1 = file_t1.getSize();

		if (size_t1 == 0) {
			return new ResponseEntity<Object>("FAIL::Real Data 파일은 필수 입니다.", HttpStatus.OK);
		} else {
			String uuid = UUID.randomUUID().toString();
			String fullPath = checkAndMakeBaseDir(user_id);
			String fileName1 = uuid + "_" + campaign.getAdm_id() + "_"+ file_t1.getName();
			String saveFileName_t1 = fullPath + File.separator + fileName1;
			
			campaign.setCam_ofilename(saveFileName_t1);
			campaign.setFile_r_type("REAL");
			saveFile(file_t1, saveFileName_t1);
			campaign.setFile_r_name(fileName1);
			campaign.setFile_dir(fullPath);
			log.info("Request List........ - {}", campaign);
			campaignService.insertCampaignRtype(campaign);
			//targetFlag = 1;

			return new ResponseEntity<Object>("OK::등록 성공", HttpStatus.OK);
		}
	}
	@RequestMapping(value = "/searchPath")
	public AI_CAMPAIGN getPredictPath(String camid, HttpSession session) {
		log.info("Request List........ - {}", camid);
		AI_CAMPAIGN campaign = new AI_CAMPAIGN();
		
		campaign.setSrc_id(camid);
		AI_CAMPAIGN out_campaign = campaignService.selectPredictPath(campaign);
		return out_campaign;
	}
	@RequestMapping(value= "/fileDown")
	public FileSystemResource download(String path, 
			HttpServletRequest request, HttpServletResponse response){
		
		String filePath = path;
		File downloadFile = null;
		downloadFile = new File(filePath);
		response.setHeader( "Set-Cookie", "fileDownload=true; path=/" );
		response.setHeader("Content-Disposition", "attachment; filename=" + downloadFile.getName());

	     return new FileSystemResource(downloadFile);
	}
	private String checkAndMakeBaseDir(String user_id) {
		String fullPath = baseDir + user_id;
		File f = new File(fullPath);
		if (!f.exists()) {
			f.mkdirs();
		}
		return fullPath;
	}

	private void saveFile(MultipartFile file_t1, String saveFileName_t1) {
		try (InputStream in = file_t1.getInputStream(); FileOutputStream fos = new FileOutputStream(saveFileName_t1)) {
			int readCount = 0;
			byte[] buffer = new byte[512];
			while ((readCount = in.read(buffer)) != -1) {
				fos.write(buffer, 0, readCount);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	@RequestMapping(value = "/downPredict/{cam_id}", produces = "text/csv")
	public void downloadPredict(@PathVariable String cam_id, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			log.info("downloadPredict :: cam_id :: {}", cam_id);
			String[] values = cam_id.split("_");
			String oriFileName = values[0] + "_예측 데이터.csv";
			String client = "";
			boolean skip = false;
			OutputStream os = null;
			client = request.getHeader("User-Agent");
			response.reset();
			response.setContentType("application/csv");
			response.setHeader("Content-Description", "CSV Generated Data");
			if (!skip) {
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else if (client.indexOf("Trident") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else {
					response.setHeader("Content-Disposition",
							"attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
					response.setHeader("Content-Type", "application/csv; charset=utf-8");
				}
				AI_PAGE vo = new AI_PAGE();
				vo.setCam_id(values[0]);
				vo.setSuccVal(values[1]);
				vo.setPage_st(values[2]);
				if (!(values[3].equals("0"))) {
					vo.setPage_end(values[3]);
				} else {
					AI_STAGING staging = new AI_STAGING();
					staging.setCam_id(vo.getCam_id());
					vo.setPage_end(stagingService.selectStagingTestCnt(staging) + "");
				}
				log.info("downloadPredict :: vo :: {}", vo);
				List<AI_STAGING> lists = stagingService.selectTestPredict(vo);
				StringBuilder sb = new StringBuilder();
				for (AI_STAGING list : lists) {
					sb.append(list.toString());
				}
				response.setHeader("Content-Length", "" + sb.length());
				os = response.getOutputStream();
				os.write(sb.toString().getBytes());
			} else {
				response.setContentType("text/html;charset=UTF-8");
				System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
			}
			os.close();
		} catch (Exception e) {
			System.out.println("ERROR : " + e.getMessage());
		}
	}

	@RequestMapping(value = "/down/predict/{camId}/{succProb}", produces = "text/csv")
	public void downloadCsvPredict(@PathVariable String camId, @PathVariable String succProb,
			@PathVariable String extractCnt, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			log.info("download 예측 파라메터 :: cam_id :: " + camId + ", 성공률 :: " + succProb + ", 추출건수 :: " + extractCnt);
			String oriFileName = camId + "_예측 데이터.csv";
			String client = "";
			boolean skip = false;
			OutputStream os = null;
			client = request.getHeader("User-Agent");
			response.reset();
			response.setContentType("application/csv");
			response.setHeader("Content-Description", "CSV Generated Data");
			if (!skip) {
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else if (client.indexOf("Trident") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else {
					response.setHeader("Content-Disposition",
							"attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
					response.setHeader("Content-Type", "application/csv; charset=utf-8");
				}
				Map<String, Object> paramMap = new HashMap<>();
				paramMap.put("camId", Integer.valueOf(camId));
				paramMap.put("succProb", Double.valueOf(succProb));
				paramMap.put("extractCnt", Integer.valueOf(extractCnt));
				log.info("downloadPredict :: param :: {}", paramMap);
				List<AIPredict> lists = predictService.getPredictDown(paramMap);
				StringBuilder sb = new StringBuilder();
				for (AIPredict list : lists) {
					sb.append(list.toString());
				}
				response.setHeader("Content-Length", "" + sb.length());
				os = response.getOutputStream();
				os.write(sb.toString().getBytes());
			} else {
				response.setContentType("text/html;charset=UTF-8");
				System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
			}
			os.close();
		} catch (Exception e) {
			System.out.println("ERROR : " + e.getMessage());
		}
	}
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
