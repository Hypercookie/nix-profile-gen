# Auto-generated from ProfileManifests: com.apple.touristd.plist
# Domain: com.apple.touristd
# Title: New to Mac / Tours
# Platforms: macOS

{ lib, ... }:

with lib;

{
  options.programs.macprofile.payloads."managed-apple-com-apple-touristd" = {
    enable = lib.mkEnableOption "New to Mac / Tours";

    _domain = lib.mkOption {
      internal = true;
      type = lib.types.str;
      default = "com.apple.touristd";
      description = "The payload domain (PayloadType) for this manifest.";
    };

    PFC_SegmentedControl_0 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
    };

    seed_viewed__trJt2VsTvK1yfPGwOySDw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/imac-21a";
    };

    seed_viewed___vP78HsSh_Yeb4xJnUT9A = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/osx/mac/10.12/macbook-pro-15";
    };

    seed_viewed_2_LvxAVyT6qnV1sDMZT0NA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/osx/mac/10.12/macbook-pro-13d";
    };

    seed_viewed_40reAuuYTHOsx4oGcx4qrA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/mojave/imac-pro";
    };

    seed_viewed_APhNaYV1RxSS41lC7ZJJ9Q = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/imac-pro";
    };

    seed_viewed_B70mVuHeT0WUgKh_VdUuZQ = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/osx/mac/10.12/macbook-pro-13c";
    };

    seed_viewed_EBFV2ZqnQiaqrZhvyifLeQ = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/mojave/mid-2019/macbook-pro-13/";
    };

    seed_viewed_ETJeJ9_1QmmWUde7uK8fDg = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/macbook-pro-13";
    };

    seed_viewed_EWfaSdJwR_6f1BYGiyLpcQ = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/osx/mac/10.12/macbook-pro-15d";
    };

    seed_viewed_EeEFv8cyS0CVe3ia2UEehA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/mojave/imac-21a";
    };

    seed_viewed_FQrkbNP9ThKQQtpqx2saFg = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/Sierra/macbook";
    };

    seed_viewed_GZAJdmpdSqmfH2PkCr8ebw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/Sierra/macbook-pro-13d";
    };

    seed_viewed_JTecrrXDSVut2tSfltty9Q = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/Sierra/macbook-pro-13c";
    };

    seed_viewed_KwUoo0fRRM2VPmIm0V67xg = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/imac";
    };

    seed_viewed_LR2P9_rnQ2q9xSUy1ZgWOw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/mac-basics";
    };

    seed_viewed_MM3ne3nTR9eXFyVwZ5gN7Q = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/macbook-pro-15";
    };

    seed_viewed_Pa88nesPSO6POlutVN4_Sg = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/osx/mac/10.12/macbook";
    };

    seed_viewed_SdV08ZZQRxOCWq6JBEXmfg = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/osx-elcapitan/get-to-know-your-mac-book";
    };

    seed_viewed_SkI_dLAkQu6k_qpzSOG6Iw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/mojave/mid-2019/macbook-air";
    };

    seed_viewed_Tu81gKhDTvmNkjyqcPBfKA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/mojave/macbook-air/";
    };

    seed_viewed_catalina_macbook_air = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/macbook-air";
    };

    seed_viewed_catalina_early_2020_macbook_air = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/early-2020/macbook-air";
    };

    seed_viewed_bigsur_late_2020_macbook_air = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/macbook-air";
    };

    seed_viewed_UhiR1M79RWmXLIQr4M0AWw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/Sierra/mid-2017/imac-21r";
    };

    seed_viewed_WEyaCPMVRB6HbnmRq9EnNQ = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/Sierra/mid-2017/imac-21a";
    };

    seed_viewed_We59wh_OTa6c1yas_yppwg = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/mojave/macbook";
    };

    seed_viewed_aytyxqEmTIOvEz3iS4IbkA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/mojave/early-2019/imac";
    };

    seed_viewed_b_dLke8ZTQaN9KKrxfwDQw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/macbook";
    };

    seed_viewed_baXokbqsQ_2KLkzIZrR6ng = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/mojave/mac-mini/";
    };

    seed_viewed_bydF6fX5Sp6aBYdEXD0VwQ = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/mojave/mac-basics";
    };

    seed_viewed_d_gfl8CNTNeauANKjf9WqA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/Sierra/mid-2017/imac-27";
    };

    seed_viewed_f_Pn3F4RScOh_GUBKO9sRA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/whats-new";
    };

    seed_viewed_fWRpNw7IR3S3qxX63nmvMw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/mojave/macbook-pro-13";
    };

    seed_viewed_hP2OZh_MTEKeFcjgec2gZw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/mojave/late-2018/macbook/";
    };

    seed_viewed_krdWS8DSQIqJSqQFXW1_pw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/mid-2018/macbook-pro";
    };

    seed_viewed_kti4ZkMKQFyCL2kbgCY23A = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/Sierra/macbook-pro-15d";
    };

    seed_viewed_lEDfW5O_SZe8KTQ93HGOPA = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/high-sierra/macbook-pro";
    };

    seed_viewed_lQlm1yrMS0GPVyAL44id_A = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/mojave/whats-new";
    };

    seed_viewed_n87FVu1TSwGzble8vqBvsg = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/osx/mac/10.12/macbook-pro-15";
    };

    seed_viewed_pDWyREoARJm5V1mJYr9GKg = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/mojave/imac";
    };

    seed_viewed_catalina_imac = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/imac";
    };

    seed_viewed_catalina_imac_21a = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/imac-21a";
    };

    seed_viewed_catalina_mid_2020_imac = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/mid-2020/imac";
    };

    seed_viewed_bigsur_imac = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/imac";
    };

    seed_viewed_bigsur_imac_21 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/imac-21";
    };

    seed_viewed_bigsur_early_2021_imac_24_2 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/early-2021/imac-24-2";
    };

    seed_viewed_bigsur_early_2021_imac_24_4 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/early-2021/imac-24-4";
    };

    seed_viewed_srluh6uOQiuWCzxguqhDNw = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macOS/mojave/macbook-pro";
    };

    seed_viewed_catalina_late_2019_macbook_pro = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/late-2019/macbook-pro";
    };

    seed_viewed_catalina_macbook_pro = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/macbook-pro";
    };

    seed_viewed_catalina_macbook_pro_13 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/macbook-pro-13";
    };

    seed_viewed_catalina_early_2020_macbook_pro_13 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/early-2020/macbook-pro-13";
    };

    seed_viewed_bigsur_macbook_pro = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/macbook-pro";
    };

    seed_viewed_bigsur_macbook_pro_13 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/macbook-pro-13";
    };

    seed_viewed_bigsur_late_2020_macbook_pro_13 = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/late-2020/macbook-pro-13";
    };

    seed_viewed_catalina_imac_pro = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/imac-pro";
    };

    seed_viewed_bigsur_imac_pro = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/imac-pro";
    };

    seed_viewed_catalina_mac_mini = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/mac-mini";
    };

    seed_viewed_bigsur_mac_mini = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/mac-mini";
    };

    seed_viewed_bigsur_late_2020_mac_mini = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/late-2020/mac-mini";
    };

    seed_viewed_catalina_mac_pro = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/mac-pro";
    };

    seed_viewed_bigsur_mac_pro = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/mac-pro";
    };

    seed_viewed_catalina_mac_basics = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/mac-basics";
    };

    seed_viewed_catalina_whats_new = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/catalina/whats-new";
    };

    seed_viewed_bigsur_mac_basics = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/mac-basics";
    };

    seed_viewed_bigsur_whats_new = lib.mkOption {
      type = types.nullOr (types.str);
      default = null;
      description = "https://help.apple.com/macos/big-sur/whats-new";
    };

  };
}