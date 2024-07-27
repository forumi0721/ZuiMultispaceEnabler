# ZuiMultispaceEnabler

## 개요
**ZuiMultispaceEnabler**는 ROW ROM에서 Multiple Space 기능을 활성화하는 Magisk/APatch 모듈입니다.

## 주요 기능 및 구현 방식
1. **Multiple Space 기능 활성화:** 다중 앱 사용이 가능하게 합니다.
   - `ro.config.lgsi.region=PRC`, `ro.config.multispace.enabled=true` 설정을 통해 기능을 활성화합니다.

## 소스 코드
소스 코드는 GitHub에서 확인할 수 있습니다: [ZuiMultispaceEnabler 소스 코드](https://github.com/forumi0721/ZuiMultispaceEnabler)

## License
이 프로젝트는 GPLv2 라이선스를 따릅니다. 자세한 내용은 [LICENSE](https://github.com/forumi0721/ZuiMultispaceEnabler/blob/main/LICENSE)를 참고하세요.

## 설치 방법
1. **Magisk / APatch 설치**
   - ZuiMultispaceEnabler를 사용하려면 먼저 Magisk 또는 APatch를 설치해야 합니다. (루팅된 기기에서만 가능)
2. **ZuiMultispaceEnabler 다운로드 및 설치**
   - [Release 페이지](https://github.com/forumi0721/ZuiMultispaceEnabler/releases)에서 최신 버전을 다운로드하여 설치합니다.
3. **모듈 설치**
   - Magisk / APatch에서 ZuiMultispaceEnabler 모듈을 설치합니다.

## 중요 사항
- ZuiMultispaceEnabler는 PRC property를 활성화하여 부작용이 있을 수 있습니다.

## 추가
- 추가 기능 확장 및 PRC 활성화로 인한 부작용 최소화를 위해서는 [ZuiTweak](https://github.com/forumi0721/ZuiTweak) 설치가 필요합니다.

## 문의
앱 사용 중 문제가 발생하거나 문의사항이 있으면 [Issues 페이지](https://github.com/forumi0721/ZuiMultispaceEnabler/issues)를 통해 알려주세요.

## Credit
- [Magisk](https://github.com/topjohnwu/Magisk) by topjohnwu
- [APatch](https://github.com/bmax121/APatch) by bmax121
- [MMT-Extended](https://github.com/Zackptg5/MMT-Extended) by Zackptg5

