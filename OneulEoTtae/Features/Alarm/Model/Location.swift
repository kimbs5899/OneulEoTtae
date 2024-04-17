//
//  Location.swift
//  OneulEoTtae
//
//  Created by Matthew on 4/15/24.
//

import Foundation
import CoreLocation

enum Location: String, CaseIterable {
    // 서울특별시
    case seoulGangbuk = "서울특별시 강북구"
    case seoulGangdong = "서울특별시 강동구"
    case seoulGangnam = "서울특별시 강남구"
    case seoulGangseo = "서울특별시 강서구"
    case seoulGwanak = "서울특별시 관악구"
    case seoulGwangjin = "서울특별시 광진구"
    case seoulGuro = "서울특별시 구로구"
    case seoulGeumcheon = "서울특별시 금천구"
    case seoulNowon = "서울특별시 노원구"
    case seoulDobong = "서울특별시 도봉구"
    case seoulDongdaemun = "서울특별시 동대문구"
    case seoulDongjak = "서울특별시 동작구"
    case seoulMapo = "서울특별시 마포구"
    case seoulSeocho = "서울특별시 서초구"
    case seoulSeodaemun = "서울특별시 서대문구"
    case seoulSongpa = "서울특별시 송파구"
    case seoulYangcheon = "서울특별시 양천구"
    case seoulYeongdeungpo = "서울특별시 영등포구"
    case seoulYongsan = "서울특별시 용산구"
    case seoulEunpyeong = "서울특별시 은평구"
    case seoulJongno = "서울특별시 종로구"
    case seoulJung = "서울특별시 중구"
    case seoulJungnang = "서울특별시 중랑구"
    // 부산광역시
    case busanGangseo = "부산광역시 강서구"
    case busanGeumjeong = "부산광역시 금정구"
    case busanNamgu = "부산광역시 남구"
    case busanDongnae = "부산광역시 동래구"
    case busanDonggu = "부산광역시 동구"
    case busanBusanjin = "부산광역시 부산진구"
    case busanSaha = "부산광역시 사하구"
    case busanSeogu = "부산광역시 서구"
    case busanSuyeong = "부산광역시 수영구"
    case busanYeonje = "부산광역시 연제구"
    case busanYeonsgu = "부산광역시 영도구"
    case busanJunggu = "부산광역시 중구"
    // 대구광역시
    case daeguBukgu = "대구광역시 북구"
    case daeguDalseo = "대구광역시 달서구"
    case daeguDalseong = "대구광역시 달성군"
    case daeguDonggu = "대구광역시 동구"
    case daeguNamgu = "대구광역시 남구"
    case daeguSeo = "대구광역시 서구"
    case daeguSuseong = "대구광역시 수성구"
    // 인천광역시
    case incheonBupyeong = "인천광역시 부평구"
    case incheonDong = "인천광역시 동구"
    case incheonGyeyang = "인천광역시 계양구"
    case incheonNamgu = "인천광역시 남구"
    case incheonNamdong = "인천광역시 남동구"
    case incheonYeonsu = "인천광역시 연수구"
    case incheonJunggu = "인천광역시 중구"
    // 광주광역시
    case gwangjuBukgu = "광주광역시 북구"
    case gwangjuDonggu = "광주광역시 동구"
    case gwangjuGwangsan = "광주광역시 광산구"
    case gwangjuNamgu = "광주광역시 남구"
    case gwangjuSeogu = "광주광역시 서구"
    // 대전광역시
    case daejeonDonggu = "대전광역시 동구"
    case daejeonSeogu = "대전광역시 서구"
    case daejeonYuseong = "대전광역시 유성구"
    case daejeonJunggu = "대전광역시 중구"
    // 울산광역시
    case ulsanBukgu = "울산광역시 북구"
    case ulsanDonggu = "울산광역시 동구"
    case ulsanJunggu = "울산광역시 중구"
    case ulsanNamgu = "울산광역시 남구"
    case ulsanUlju = "울산광역시 울주군"
    // 세종특별자치시
    case sejongGongju = "세종특별자치시 공주시"
    case sejongDangjin = "세종특별자치시 당진시"
    case sejongDaedeok = "세종특별자치시 대덕구"
    case sejongBoryeong = "세종특별자치시 보령시"
    case sejongYuseong = "세종특별자치시 유성구"
    case sejongCheongju = "세종특별자치시 청주시"
    case sejongChungju = "세종특별자치시 충주시"
    case sejongCheongwon = "세종특별자치시 청원군"
    case sejongBuyeo = "세종특별자치시 부여군"
    case sejongBoeun = "세종특별자치시 보은군"
    case sejongHongseong = "세종특별자치시 홍성군"
    case sejongYeongju = "세종특별자치시 영주시"
    case sejongYeongcheon = "세종특별자치시 영천시"
    case sejongYeoncheon = "세종특별자치시 연천군"
    case sejongYeongdeok = "세종특별자치시 영덕군"
    case sejongYeongyang = "세종특별자치시 영양군"
    case sejongYeoju = "세종특별자치시 여주시"
    case sejongYangpyeong = "세종특별자치시 양평군"
    case sejongYangju = "세종특별자치시 양주시"
    case sejongYangsan = "세종특별자치시 양산시"
    case sejongYangcheon = "세종특별자치시 양천구"
    case sejongYeongwol = "세종특별자치시 영월군"
    // 경기도
    case gyeonggiAnseong = "경기도 안성시"
    case gyeonggiAnsan = "경기도 안산시"
    case gyeonggiAnyang = "경기도 안양시"
    case gyeonggiEuijeongbu = "경기도 의정부시"
    case gyeonggiUiwang = "경기도 의왕시"
    case gyeonggiIcheon = "경기도 이천시"
    case gyeonggiYongin = "경기도 용인시"
    case gyeonggiYangju = "경기도 양주시"
    case gyeonggiYangpyeong = "경기도 양평군"
    case gyeonggiYeoju = "경기도 여주시"
    case gyeonggiYeoui = "경기도 연천군"
    case gyeonggiOngjin = "경기도 오산시"
    case gyeonggiGunpo = "경기도 군포시"
    case gyeonggiGuri = "경기도 구리시"
    case gyeonggiGimpo = "경기도 김포시"
    case gyeonggiGoyang = "경기도 고양시"
    case gyeonggiGapyeong = "경기도 가평군"
    case gyeonggiGwacheon = "경기도 과천시"
    case gyeonggiGwangju = "경기도 광주시"
    case gyeonggiGwangmyeong = "경기도 광명시"
    case gyeonggiGwancheon = "경기도 관악시"
    case gyeonggiDongducheon = "경기도 동두천시"
    case gyeonggiBucheon = "경기도 부천시"
    case gyeonggiPaju = "경기도 파주시"
    case gyeonggiPocheon = "경기도 포천시"
    case gyeonggiPyeongtaek = "경기도 평택시"
    // 강원도
    case gangwonChuncheon = "강원도 춘천시"
    case gangwonWonju = "강원도 원주시"
    case gangwonGangneung = "강원도 강릉시"
    case gangwonDonghae = "강원도 동해시"
    case gangwonTaebaek = "강원도 태백시"
    case gangwonSokcho = "강원도 속초시"
    case gangwonSamcheok = "강원도 삼척시"
    case gangwonHongcheon = "강원도 홍천군"
    case gangwonHwacheon = "강원도 화천군"
    case gangwonYanggu = "강원도 양구군"
    case gangwonInje = "강원도 인제군"
    case gangwonGoseong = "강원도 고성군"
    case gangwonYangyang = "강원도 양양군"
    // 충청북도
    case chungbukChungju = "충청북도 충주시"
    case chungbukJecheon = "충청북도 제천시"
    case chungbukCheongwon = "충청북도 청원군"
    case chungbukBoeun = "충청북도 보은군"
    case chungbukDanyang = "충청북도 단양군"
    case chungbukGoesan = "충청북도 괴산군"
    case chungbukYeongdong = "충청북도 영동군"
    case chungbukEumseong = "충청북도 음성군"
    case chungbukJincheon = "충청북도 진천군"
    // 충청남도
    case chungnamCheonan = "충청남도 천안시"
    case chungnamGongju = "충청남도 공주시"
    case chungnamAsan = "충청남도 아산시"
    case chungnamSeosan = "충청남도 서산시"
    case chungnamNonsan = "충청남도 논산시"
    case chungnamBuyeo = "충청남도 부여군"
    case chungnamGyeryong = "충청남도 계룡시"
    case chungnamDangjin = "충청남도 당진시"
    case chungnamHongseong = "충청남도 홍성군"
    case chungnamGeumsan = "충청남도 금산군"
    case chungnamCheongyang = "충청남도 청양군"
    case chungnamSeocheon = "충청남도 서천군"
    case chungnamYesan = "충청남도 예산군"
    case chungnamTaean = "충청남도 태안군"
    // 전라북도
    case jeonbukJeonju = "전라북도 전주시"
    case jeonbukIksan = "전라북도 익산시"
    case jeonbukGunsan = "전라북도 군산시"
    case jeonbukJeongeup = "전라북도 정읍시"
    case jeonbukGimje = "전라북도 김제시"
    case jeonbukNamwon = "전라북도 남원시"
    case jeonbukWanju = "전라북도 완주군"
    case jeonbukJangsu = "전라북도 장수군"
    case jeonbukMuju = "전라북도 무주군"
    case jeonbukJinan = "전라북도 진안군"
    case jeonbukImsil = "전라북도 임실군"
    case jeonbukSunchang = "전라북도 순창군"
    case jeonbukBuan = "전라북도 부안군"
    // 전라남도
    case jeonnamMokpo = "전라남도 목포시"
    case jeonnamYeosu = "전라남도 여수시"
    case jeonnamSuncheon = "전라남도 순천시"
    case jeonnamNaju = "전라남도 나주시"
    case jeonnamGwangyang = "전라남도 광양시"
    case jeonnamDamyang = "전라남도 담양군"
    case jeonnamGoheung = "전라남도 고흥군"
    case jeonnamGokseong = "전라남도 곡성군"
    case jeonnamGurye = "전라남도 구례군"
    case jeonnamHampyeong = "전라남도 함평군"
    case jeonnamHaenam = "전라남도 해남군"
    case jeonnamHwasun = "전라남도 화순군"
    case jeonnamJangheung = "전라남도 장흥군"
    case jeonnamJindo = "전라남도 진도군"
    case jeonnamWando = "전라남도 완도군"
    case jeonnamGangjin = "전라남도 강진군"
    case jeonnamYeongam = "전라남도 영암군"
    case jeonnamYeonggwang = "전라남도 영광군"
    case jeonnamYoungyang = "전라남도 영양군"
    // 경상북도
    case gyeongbukPohang = "경상북도 포항시"
    case gyeongbukGyeongju = "경상북도 경주시"
    case gyeongbukGumi = "경상북도 구미시"
    case gyeongbukGimcheon = "경상북도 김천시"
    case gyeongbukAndong = "경상북도 안동시"
    case gyeongbukGyeongsan = "경상북도 경산시"
    case gyeongbukMungyeong = "경상북도 문경시"
    case gyeongbukYeongju = "경상북도 영주시"
    case gyeongbukYeongcheon = "경상북도 영천시"
    case gyeongbukSangju = "경상북도 상주시"
    case gyeongbukYeongdeok = "경상북도 영덕군"
    case gyeongbukUljin = "경상북도 울진군"
    case gyeongbukUlleung = "경상북도 울릉군"
    // 경상남도
    case gyeongnamChangwon = "경상남도 창원시"
    case gyeongnamGimhae = "경상남도 김해시"
    case gyeongnamYangsan = "경상남도 양산시"
    case gyeongnamGeoje = "경상남도 거제시"
    case gyeongnamTongyeong = "경상남도 통영시"
    case gyeongnamMiryang = "경상남도 밀양시"
    case gyeongnamSacheon = "경상남도 사천시"
    case gyeongnamJinju = "경상남도 진주시"
    case gyeongnamChangnyeong = "경상남도 창녕군"
    case gyeongnamGoseong = "경상남도 고성군"
    case gyeongnamNamhae = "경상남도 남해군"
    case gyeongnamHadong = "경상남도 하동군"
    case gyeongnamHaman = "경상남도 함안군"
    case gyeongnamHamyang = "경상남도 함양군"
    case gyeongnamGeochang = "경상남도 거창군"
    case gyeongnamMulgeum = "경상남도 무릉군"
    case gyeongnamSancheong = "경상남도 산청군"
    case gyeongnamHapcheon = "경상남도 합천군"
    // 제주특별자치도
    case jejuJeju = "제주특별자치도 제주시"
    case jejuSeogwipo = "제주특별자치도 서귀포시"
    
    var location: CLLocation {
        switch self {
        case .seoulGangbuk:
            return CLLocation(latitude: 37.6397, longitude: 127.0256) // 강북구 도봉한강공원
        case .seoulGangdong:
            return CLLocation(latitude: 37.5459, longitude: 127.1461) // 강동구 천호대로
        case .seoulGangnam:
            return CLLocation(latitude: 37.4979, longitude: 127.0276) // 강남구 강남대로
        case .seoulGangseo:
            return CLLocation(latitude: 37.5547, longitude: 126.8199) // 강서구 하늘공원
        case .seoulGwanak:
            return CLLocation(latitude: 37.4875, longitude: 126.9431) // 관악구 서울대학교
        case .seoulGwangjin:
            return CLLocation(latitude: 37.5437, longitude: 127.0863) // 광진구 뚝섬한강공원
        case .seoulGuro:
            return CLLocation(latitude: 37.4954, longitude: 126.8870) // 구로구 금천구청역
        case .seoulGeumcheon:
            return CLLocation(latitude: 37.4573, longitude: 126.9027) // 금천구 시흥대로
        case .seoulNowon:
            return CLLocation(latitude: 37.6550, longitude: 127.0637) // 노원구 상계근린공원
        case .seoulDobong:
            return CLLocation(latitude: 37.6660, longitude: 127.0474) // 도봉구 도봉산
        case .seoulDongdaemun:
            return CLLocation(latitude: 37.5745, longitude: 127.0396) // 동대문구 종로성대입구역
        case .seoulDongjak:
            return CLLocation(latitude: 37.5125, longitude: 126.9398) // 동작구 난곡산
        case .seoulMapo:
            return CLLocation(latitude: 37.5550, longitude: 126.9056) // 마포구 홍대입구역
        case .seoulSeocho:
            return CLLocation(latitude: 37.4840, longitude: 127.0322) // 서초구 서울교대역
        case .seoulSeodaemun:
            return CLLocation(latitude: 37.5790, longitude: 126.9367) // 서대문구 이대입구역
        case .seoulSongpa:
            return CLLocation(latitude: 37.5145, longitude: 127.1058) // 송파구 올림픽공원
        case .seoulYangcheon:
            return CLLocation(latitude: 37.5275, longitude: 126.8565) // 양천구 목동
        case .seoulYeongdeungpo:
            return CLLocation(latitude: 37.5208, longitude: 126.9073) // 영등포구 여의도 한강공원
        case .seoulYongsan:
            return CLLocation(latitude: 37.5311, longitude: 126.9811) // 용산구 남산타워
        case .seoulEunpyeong:
            return CLLocation(latitude: 37.6099, longitude: 126.9348) // 은평구 불광천
        case .seoulJongno:
            return CLLocation(latitude: 37.5730, longitude: 126.9794) // 종로구 광화문
        case .seoulJung:
            return CLLocation(latitude: 37.5635, longitude: 126.9899) // 중구 을지로입구역
        case .seoulJungnang:
            return CLLocation(latitude: 37.6066, longitude: 127.0927) // 중랑구 중랑천
        case .busanGangseo:
            return CLLocation(latitude: 35.1798, longitude: 128.8913)
        case .busanGeumjeong:
            return CLLocation(latitude: 35.2449, longitude: 129.0915)
        case .busanNamgu:
            return CLLocation(latitude: 35.1376, longitude: 129.0822)
        case .busanDongnae:
            return CLLocation(latitude: 35.2139, longitude: 129.0853)
        case .busanDonggu:
            return CLLocation(latitude: 35.1295, longitude: 129.0469)
        case .busanBusanjin:
            return CLLocation(latitude: 35.1631, longitude: 129.0514)
        case .busanSaha:
            return CLLocation(latitude: 35.1063, longitude: 129.0300)
        case .busanSeogu:
            return CLLocation(latitude: 35.1153, longitude: 129.0402)
        case .busanSuyeong:
            return CLLocation(latitude: 35.1550, longitude: 129.1139)
        case .busanYeonje:
            return CLLocation(latitude: 35.2370, longitude: 129.0819)
        case .busanYeonsgu:
            return CLLocation(latitude: 35.0912, longitude: 129.0695)
        case .busanJunggu:
            return CLLocation(latitude: 35.1028, longitude: 129.0314)
        case .daeguBukgu:
            return CLLocation(latitude: 35.8920, longitude: 128.5880)
        case .daeguDalseo:
            return CLLocation(latitude: 35.8354, longitude: 128.5654)
        case .daeguDalseong:
            return CLLocation(latitude: 35.8273, longitude: 128.5028)
        case .daeguDonggu:
            return CLLocation(latitude: 35.8722, longitude: 128.5976)
        case .daeguNamgu:
            return CLLocation(latitude: 35.8663, longitude: 128.5969)
        case .daeguSeo:
            return CLLocation(latitude: 35.8722, longitude: 128.5829)
        case .daeguSuseong:
            return CLLocation(latitude: 35.8315, longitude: 128.5982)
        case .incheonBupyeong:
            return CLLocation(latitude: 37.4870, longitude: 126.7244)
        case .incheonDong:
            return CLLocation(latitude: 37.4711, longitude: 126.6328)
        case .incheonGyeyang:
            return CLLocation(latitude: 37.5717, longitude: 126.7420)
        case .incheonNamgu:
            return CLLocation(latitude: 37.4496, longitude: 126.6669)
        case .incheonNamdong:
            return CLLocation(latitude: 37.3907, longitude: 126.7276)
        case .incheonYeonsu:
            return CLLocation(latitude: 37.4139, longitude: 126.6789)
        case .incheonJunggu:
            return CLLocation(latitude: 37.4725, longitude: 126.6243)
        case .gwangjuBukgu:
            return CLLocation(latitude: 35.1801, longitude: 126.8646)
        case .gwangjuDonggu:
            return CLLocation(latitude: 35.1519, longitude: 126.9161)
        case .gwangjuGwangsan:
            return CLLocation(latitude: 35.1630, longitude: 126.8821)
        case .gwangjuNamgu:
            return CLLocation(latitude: 35.1458, longitude: 126.8831)
        case .gwangjuSeogu:
            return CLLocation(latitude: 35.1372, longitude: 126.8360)
        case .daejeonDonggu:
            return CLLocation(latitude: 36.3563, longitude: 127.4075)
        case .daejeonSeogu:
            return CLLocation(latitude: 36.3414, longitude: 127.3588)
        case .daejeonYuseong:
            return CLLocation(latitude: 36.3483, longitude: 127.3416)
        case .daejeonJunggu:
            return CLLocation(latitude: 36.3270, longitude: 127.4194)
        case .ulsanBukgu:
            return CLLocation(latitude: 35.5802, longitude: 129.3566)
        case .ulsanDonggu:
            return CLLocation(latitude: 35.5289, longitude: 129.4194)
        case .ulsanJunggu:
            return CLLocation(latitude: 35.5667, longitude: 129.3380)
        case .ulsanNamgu:
            return CLLocation(latitude: 35.5433, longitude: 129.3134)
        case .ulsanUlju:
            return CLLocation(latitude: 35.5865, longitude: 129.2175)
        case .sejongGongju:
            return CLLocation(latitude: 36.4676, longitude: 127.2892)
        case .sejongDangjin:
            return CLLocation(latitude: 36.8937, longitude: 126.6253)
        case .sejongDaedeok:
            return CLLocation(latitude: 36.3529, longitude: 127.4037)
        case .sejongBoryeong:
            return CLLocation(latitude: 36.3370, longitude: 126.6128)
        case .sejongYuseong:
            return CLLocation(latitude: 36.3606, longitude: 127.3488)
        case .sejongCheongju:
            return CLLocation(latitude: 36.6377, longitude: 127.4895)
        case .sejongChungju:
            return CLLocation(latitude: 36.6372, longitude: 127.4894)
        case .sejongCheongwon:
            return CLLocation(latitude: 36.6432, longitude: 127.4825)
        case .sejongBuyeo:
            return CLLocation(latitude: 36.2798, longitude: 126.9120)
        case .sejongBoeun:
            return CLLocation(latitude: 36.4987, longitude: 127.7137)
        case .sejongHongseong:
            return CLLocation(latitude: 36.5986, longitude: 126.6680)
        case .sejongYeongju:
            return CLLocation(latitude: 36.6461, longitude: 127.4823)
        case .sejongYeongcheon:
            return CLLocation(latitude: 36.2210, longitude: 127.2000)
        case .sejongYeoncheon:
            return CLLocation(latitude: 36.9747, longitude: 127.9116)
        case .sejongYeongdeok:
            return CLLocation(latitude: 36.1751, longitude: 128.4194)
        case .sejongYeongyang:
            return CLLocation(latitude: 36.7973, longitude: 127.5887)
        case .sejongYeoju:
            return CLLocation(latitude: 37.3019, longitude: 127.6378)
        case .sejongYangpyeong:
            return CLLocation(latitude: 37.5027, longitude: 127.5411)
        case .sejongYangju:
            return CLLocation(latitude: 37.8322, longitude: 127.0771)
        case .sejongYangsan:
            return CLLocation(latitude: 35.3805, longitude: 128.6469)
        case .sejongYangcheon:
            return CLLocation(latitude: 37.6173, longitude: 126.8664)
        case .sejongYeongwol:
            return CLLocation(latitude: 37.1819, longitude: 128.4668)
        case .gyeonggiAnseong:
            return CLLocation(latitude: 37.0102, longitude: 127.2707)
        case .gyeonggiAnsan:
            return CLLocation(latitude: 37.3230, longitude: 126.8213)
        case .gyeonggiAnyang:
            return CLLocation(latitude: 37.3920, longitude: 126.9263)
        case .gyeonggiEuijeongbu:
            return CLLocation(latitude: 37.7415, longitude: 127.0474)
        case .gyeonggiUiwang:
            return CLLocation(latitude: 37.3836, longitude: 127.0360)
        case .gyeonggiIcheon:
            return CLLocation(latitude: 37.2799, longitude: 127.4429)
        case .gyeonggiYongin:
            return CLLocation(latitude: 37.2411, longitude: 127.1776)
        case .gyeonggiYangju:
            return CLLocation(latitude: 37.8322, longitude: 127.0771)
        case .gyeonggiYangpyeong:
            return CLLocation(latitude: 37.4924, longitude: 127.4949)
        case .gyeonggiYeoju:
            return CLLocation(latitude: 37.2968, longitude: 127.6352)
        case .gyeonggiYeoui:
            return CLLocation(latitude: 37.7081, longitude: 126.9170)
        case .gyeonggiOngjin:
            return CLLocation(latitude: 37.3013, longitude: 126.6120)
        case .gyeonggiGunpo:
            return CLLocation(latitude: 37.3586, longitude: 126.9784)
        case .gyeonggiGuri:
            return CLLocation(latitude: 37.6031, longitude: 127.1390)
        case .gyeonggiGimpo:
            return CLLocation(latitude: 37.6075, longitude: 126.7150)
        case .gyeonggiGoyang:
            return CLLocation(latitude: 37.6567, longitude: 126.8352)
        case .gyeonggiGapyeong:
            return CLLocation(latitude: 37.8283, longitude: 127.5093)
        case .gyeonggiGwacheon:
            return CLLocation(latitude: 37.4265, longitude: 127.0745)
        case .gyeonggiGwangju:
            return CLLocation(latitude: 37.3945, longitude: 127.2522)
        case .gyeonggiGwangmyeong:
            return CLLocation(latitude: 37.4782, longitude: 126.8662)
        case .gyeonggiGwancheon:
            return CLLocation(latitude: 37.2562, longitude: 127.4815)
        case .gyeonggiDongducheon:
            return CLLocation(latitude: 37.9016, longitude: 127.0600)
        case .gyeonggiBucheon:
            return CLLocation(latitude: 37.4986, longitude: 126.7831)
        case .gyeonggiPaju:
            return CLLocation(latitude: 37.7598, longitude: 126.7759)
        case .gyeonggiPocheon:
            return CLLocation(latitude: 37.8865, longitude: 127.2005)
        case .gyeonggiPyeongtaek:
            return CLLocation(latitude: 36.9924, longitude: 127.1129)
        case .gangwonChuncheon:
            return CLLocation(latitude: 37.8747, longitude: 127.7342)
        case .gangwonWonju:
            return CLLocation(latitude: 37.3514, longitude: 127.9455)
        case .gangwonGangneung:
            return CLLocation(latitude: 37.7519, longitude: 128.8761)
        case .gangwonDonghae:
            return CLLocation(latitude: 37.4986, longitude: 129.1214)
        case .gangwonTaebaek:
            return CLLocation(latitude: 37.1744, longitude: 128.9886)
        case .gangwonSokcho:
            return CLLocation(latitude: 38.2083, longitude: 128.5911)
        case .gangwonSamcheok:
            return CLLocation(latitude: 37.4486, longitude: 129.1682)
        case .gangwonHongcheon:
            return CLLocation(latitude: 37.6870, longitude: 127.8780)
        case .gangwonHwacheon:
            return CLLocation(latitude: 38.0817, longitude: 127.7061)
        case .gangwonYanggu:
            return CLLocation(latitude: 38.1050, longitude: 127.9903)
        case .gangwonInje:
            return CLLocation(latitude: 38.0661, longitude: 128.1732)
        case .gangwonGoseong:
            return CLLocation(latitude: 38.3801, longitude: 128.4674)
        case .gangwonYangyang:
            return CLLocation(latitude: 38.0762, longitude: 128.6298)
        case .chungbukChungju:
            return CLLocation(latitude: 36.9710, longitude: 127.9324)
        case .chungbukJecheon:
            return CLLocation(latitude: 37.1494, longitude: 128.2127)
        case .chungbukCheongwon:
            return CLLocation(latitude: 36.6398, longitude: 127.4345)
        case .chungbukBoeun:
            return CLLocation(latitude: 36.4910, longitude: 127.7384)
        case .chungbukDanyang:
            return CLLocation(latitude: 36.9824, longitude: 128.3842)
        case .chungbukGoesan:
            return CLLocation(latitude: 36.8164, longitude: 127.7956)
        case .chungbukYeongdong:
            return CLLocation(latitude: 36.1774, longitude: 127.7838)
        case .chungbukEumseong:
            return CLLocation(latitude: 36.9370, longitude: 127.6833)
        case .chungbukJincheon:
            return CLLocation(latitude: 36.8575, longitude: 127.4338)
        case .chungnamCheonan:
            return CLLocation(latitude: 36.8146, longitude: 127.1470)
        case .chungnamGongju:
            return CLLocation(latitude: 36.4506, longitude: 127.1276)
        case .chungnamAsan:
            return CLLocation(latitude: 36.7895, longitude: 127.0045)
        case .chungnamSeosan:
            return CLLocation(latitude: 36.7830, longitude: 126.4503)
        case .chungnamNonsan:
            return CLLocation(latitude: 36.2022, longitude: 127.0946)
        case .chungnamBuyeo:
            return CLLocation(latitude: 36.2721, longitude: 126.9173)
        case .chungnamGyeryong:
            return CLLocation(latitude: 36.2732, longitude: 127.2361)
        case .chungnamDangjin:
            return CLLocation(latitude: 37.0202, longitude: 126.7067)
        case .chungnamHongseong:
            return CLLocation(latitude: 36.6023, longitude: 126.6692)
        case .chungnamGeumsan:
            return CLLocation(latitude: 36.1083, longitude: 127.5888)
        case .chungnamCheongyang:
            return CLLocation(latitude: 36.4383, longitude: 126.8099)
        case .chungnamSeocheon:
            return CLLocation(latitude: 36.0567, longitude: 126.6899)
        case .chungnamYesan:
            return CLLocation(latitude: 36.6787, longitude: 126.8535)
        case .chungnamTaean:
            return CLLocation(latitude: 36.7441, longitude: 126.3330)
        case .jeonbukJeonju:
            return CLLocation(latitude: 35.8242, longitude: 127.1480)
        case .jeonbukIksan:
            return CLLocation(latitude: 35.9435, longitude: 126.9547)
        case .jeonbukGunsan:
            return CLLocation(latitude: 35.9799, longitude: 126.7157)
        case .jeonbukJeongeup:
            return CLLocation(latitude: 35.5706, longitude: 126.8560)
        case .jeonbukGimje:
            return CLLocation(latitude: 35.8120, longitude: 126.8926)
        case .jeonbukNamwon:
            return CLLocation(latitude: 35.4122, longitude: 127.3864)
        case .jeonbukWanju:
            return CLLocation(latitude: 35.8462, longitude: 127.1505)
        case .jeonbukJangsu:
            return CLLocation(latitude: 35.5634, longitude: 126.8132)
        case .jeonbukMuju:
            return CLLocation(latitude: 36.0073, longitude: 127.6684)
        case .jeonbukJinan:
            return CLLocation(latitude: 35.7885, longitude: 127.4167)
        case .jeonbukImsil:
            return CLLocation(latitude: 35.6183, longitude: 127.2793)
        case .jeonbukSunchang:
            return CLLocation(latitude: 35.4095, longitude: 127.1426)
        case .jeonbukBuan:
            return CLLocation(latitude: 35.7100, longitude: 126.7159)
        case .jeonnamMokpo:
            return CLLocation(latitude: 34.7931, longitude: 126.3912)
        case .jeonnamYeosu:
            return CLLocation(latitude: 34.7440, longitude: 127.7383)
        case .jeonnamSuncheon:
            return CLLocation(latitude: 34.9506, longitude: 127.4877)
        case .jeonnamNaju:
            return CLLocation(latitude: 35.0140, longitude: 126.7102)
        case .jeonnamGwangyang:
            return CLLocation(latitude: 34.9416, longitude: 127.6957)
        case .jeonnamDamyang:
            return CLLocation(latitude: 35.3182, longitude: 126.9910)
        case .jeonnamGoheung:
            return CLLocation(latitude: 34.8861, longitude: 127.3869)
        case .jeonnamGokseong:
            return CLLocation(latitude: 35.2891, longitude: 127.2940)
        case .jeonnamGurye:
            return CLLocation(latitude: 35.2109, longitude: 127.4768)
        case .jeonnamHampyeong:
            return CLLocation(latitude: 35.0552, longitude: 126.5465)
        case .jeonnamHaenam:
            return CLLocation(latitude: 34.5718, longitude: 126.5977)
        case .jeonnamHwasun:
            return CLLocation(latitude: 35.0635, longitude: 126.9859)
        case .jeonnamJangheung:
            return CLLocation(latitude: 34.6432, longitude: 126.9056)
        case .jeonnamJindo:
            return CLLocation(latitude: 34.4439, longitude: 126.3210)
        case .jeonnamWando:
            return CLLocation(latitude: 34.3121, longitude: 126.7313)
        case .jeonnamGangjin:
            return CLLocation(latitude: 35.2592, longitude: 126.7154)
        case .jeonnamYeongam:
            return CLLocation(latitude: 34.3555, longitude: 126.4919)
        case .jeonnamYeonggwang:
            return CLLocation(latitude: 35.2963, longitude: 126.5043)
        case .jeonnamYoungyang:
            return CLLocation(latitude: 34.7652, longitude: 126.4837)
        case .gyeongbukPohang:
            return CLLocation(latitude: 36.0190, longitude: 129.3447)
        case .gyeongbukGyeongju:
            return CLLocation(latitude: 35.8562, longitude: 129.2247)
        case .gyeongbukGumi:
            return CLLocation(latitude: 36.1196, longitude: 128.3443)
        case .gyeongbukGimcheon:
            return CLLocation(latitude: 36.1240, longitude: 128.1190)
        case .gyeongbukAndong:
            return CLLocation(latitude: 36.5682, longitude: 128.7290)
        case .gyeongbukGyeongsan:
            return CLLocation(latitude: 35.8238, longitude: 128.7379)
        case .gyeongbukMungyeong:
            return CLLocation(latitude: 36.5939, longitude: 128.1892)
        case .gyeongbukYeongju:
            return CLLocation(latitude: 36.8265, longitude: 128.6198)
        case .gyeongbukYeongcheon:
            return CLLocation(latitude: 35.9664, longitude: 128.9444)
        case .gyeongbukSangju:
            return CLLocation(latitude: 36.4099, longitude: 128.1514)
        case .gyeongbukYeongdeok:
            return CLLocation(latitude: 36.4159, longitude: 129.3722)
        case .gyeongbukUljin:
            return CLLocation(latitude: 36.9921, longitude: 129.4124)
        case .gyeongbukUlleung:
            return CLLocation(latitude: 37.4943, longitude: 130.9014)
        case .gyeongnamChangwon:
            return CLLocation(latitude: 35.2285, longitude: 128.6811)
        case .gyeongnamGimhae:
            return CLLocation(latitude: 35.2284, longitude: 128.8810)
        case .gyeongnamYangsan:
            return CLLocation(latitude: 35.3382, longitude: 129.0389)
        case .gyeongnamGeoje:
            return CLLocation(latitude: 34.8781, longitude: 128.6163)
        case .gyeongnamTongyeong:
            return CLLocation(latitude: 34.8544, longitude: 128.4302)
        case .gyeongnamMiryang:
            return CLLocation(latitude: 35.4903, longitude: 128.7485)
        case .gyeongnamSacheon:
            return CLLocation(latitude: 35.0058, longitude: 128.0712)
        case .gyeongnamJinju:
            return CLLocation(latitude: 35.1960, longitude: 128.0846)
        case .gyeongnamChangnyeong:
            return CLLocation(latitude: 35.5411, longitude: 128.4935)
        case .gyeongnamGoseong:
            return CLLocation(latitude: 34.9762, longitude: 128.3230)
        case .gyeongnamNamhae:
            return CLLocation(latitude: 34.8459, longitude: 127.8920)
        case .gyeongnamHadong:
            return CLLocation(latitude: 35.0710, longitude: 127.7533)
        case .gyeongnamHaman:
            return CLLocation(latitude: 35.2680, longitude: 128.4176)
        case .gyeongnamHamyang:
            return CLLocation(latitude: 35.5107, longitude: 127.7324)
        case .gyeongnamGeochang:
            return CLLocation(latitude: 35.6785, longitude: 127.9063)
        case .gyeongnamMulgeum:
            return CLLocation(latitude: 35.2770, longitude: 128.3691)
        case .gyeongnamSancheong:
            return CLLocation(latitude: 35.4152, longitude: 127.8782)
        case .gyeongnamHapcheon:
            return CLLocation(latitude: 35.5640, longitude: 128.1681)
        case .jejuJeju:
            return CLLocation(latitude: 33.4890, longitude: 126.4983)
        case .jejuSeogwipo:
            return CLLocation(latitude: 33.2537, longitude: 126.5618)
        }
    }
}

