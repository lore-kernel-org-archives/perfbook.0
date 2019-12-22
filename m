Return-Path: <SRS0=f179=2M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=T8KValp1zcckab0Mpb2mcBNvZOtLCToP1iJvkeU75oI=;
        b=LxgQQklaV1LdO4K6qIjR/QUu/3gVVp+uwnhKbXd/kRWK7njVyhjhfGQOC4BJsFMe4h
         hFdE6D0Gbc4D0UGKEKLqoVEfIwDplD4L9ltdsIoC/TChud3UQsSvHiNx3S4F/TFrjcBX
         oaT7V+Yy3BS5cv8DWiDAif90tC3CZ5gvrVyUEoKxRiD4ZoUq7dlrBlXMfkripMgT7JwT
         yKRRJ05hHB84sJTvNROHsvYeaiyUfgcaM8sILGNKP5E2oIHLAHS26iQL7wDwIvLNlIk8
         NJ8B4GowOoJRq3qRHz4HN3N+M7XU9t28f0ksBlWA3gST+4Qv7tGsLclVH1qwTHf1W/co
         VOxw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] utilities/autodate: Fix build error by adding '\ ' in \date{}
Message-ID: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
Date: Mon, 23 Dec 2019 08:47:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7a420a8ee7df573f736c0c003ae2bc55f91bfbb0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 23 Dec 2019 07:35:59 +0900
Subject: [PATCH] utilities/autodate: Fix build error by adding '\ ' in \date{}

\date{} command does not accept an empty line.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/autodate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 4e448976..96a25777 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -47,7 +47,7 @@ year=`date --date="$date_str" +%Y`
 day=`date --date="$date_str" +%e`
 if test -n "$release"
 then
-	release="\\\\\\\\ Release $release"
+	release="\\\\ \\  \\\\ Release $release"
 fi
 
 # env printf "\\date{%s %s, %s %s %s}\n" $month $day $year $modified $release
-- 
2.24.1


