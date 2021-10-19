Return-Path: <SRS0=qhXQ=PH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Sh0j7NU/+D9ESxcMbbZ6l+EK+mPMR7Buv2+YV3AYcYU=;
        b=U6Md1FABxXiSnFnHiAP4Bet96haKL4JAf4IHvwRQ1snRyyBcIaPD5qQ8l1XbrvSDKz
         6Qch0JKAUiJT5zxUBj5pHf9UOmUYw5jbblQLzpPE29PTifbyryx7Cdf3A2sGqNhrs59w
         xvBj5yGvVTgtDa5UtcCG9O3PsRhtYOBeKl019tTVs5x5nD+lijpNOTSM9YD6k+8Ts6X9
         LV/9hjMyNUX4bsWA+SF18zaWWUjyBrNMxfmcKM8MCnI1c3cpL6ON7t9EdXZgE8H2GDdv
         NQNPSA5cpCBw3sk5nkuOsVW0aa6gOJmA462CQraHI84MnmoxGMQgSXzpzu3Mww7HCacV
         jnAw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] fixsvgfonts-urwps: Add patterns for 'URW Gothic'
Message-ID: <2ac75ef4-c43a-195a-f788-15f375e3b20b@gmail.com>
Date: Tue, 19 Oct 2021 11:06:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

When built on Ubuntu Focal, Figure 3.9
(cartoons/r-2014-CPU-track-meet-phone-booth.pdf) does not have the
"TELE" sign.

Ubuntu Hirsute and Fedora 34 don't have this issue, so it looks
like Ubuntu Focal lacks some configs for font-name aliases under
/etc/fonts/.

As a workaround, add patterns taking care of "URL Gothic".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I'm not sure if you have the same issue on your Ubuntu 20.04,
but I noticed it and tested the workaround on the container image at
docker.io/akiyks/perfbook-build-focal:latest.

        Thanks, Akira
--
 utilities/fixsvgfonts-urwps.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
index a3dcd91a..21eb1534 100644
--- a/utilities/fixsvgfonts-urwps.sh
+++ b/utilities/fixsvgfonts-urwps.sh
@@ -17,4 +17,6 @@ sed	-e 's+:Helvetica+:Nimbus Sans+g' \
 	-e 's+:Nimbus Sans L+:Nimbus Sans+g' \
 	-e 's+="Nimbus Sans L+="Nimbus Sans+g' \
 	-e 's+:Nimbus Mono L+:Nimbus Mono PS+g' \
-	-e 's+="Nimbus Mono L+="Nimbus Mono PS+g'
+	-e 's+="Nimbus Mono L+="Nimbus Mono PS+g' \
+	-e 's+:URW Gothic L+:URW Gothic+g' \
+	-e 's+="URW Gothic L+="URW Gothic+g'

base-commit: 6991663ee8e326bae30cf6e82c69afb310c2b250
-- 
2.17.1

