Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682810629; x=1685402629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gB5R/qD+3uVqEsgraDqTlRjvILp+3XChHQNZ14Ec6GY=;
        b=sgCmh9I8LLZMJ+Yxziw6XUaXfouvQDNK/JfvkfllArQIFyrY2h5OUwD73biyZufrec
         R13zzXnc9VgyBBGbEc2zEb4qHMLOqHsd+rw6CnbTkkbafFec7qw6Ap3OxPdTGzQCMVcm
         1CKre7CTbLwLE4leCmCNPdyd/7s79rBm1Uwyq4J2nFQ7pJlIzlN1//Xx9X7aC03a889V
         uEu2TvNj/w2N6fRh/LZ/P7CykeiOxwdfMiqk7F/wvPZ88amCj5FKvdZGUt3vE6nyZEUa
         O89V+24bzaUou5eKolkl8s5ub/N5Ku/yDWBHg8NeVDUrgE1gTKaOhiuSqa2bp9Y6syuE
         PDYA==
Message-ID: <0a03e30e-291e-549d-55e3-0e40e568880b@gmail.com>
Date: Sun, 30 Apr 2023 08:23:46 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 7/7] precheck.sh: Export LC_TIME
Content-Language: en-US
References: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The check script doesn't work properly under non-English locale
settings due to missing "export".

Fix it.

Fixes: 0c852f175f8e ("Add precheck.sh")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/precheck.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utilities/precheck.sh b/utilities/precheck.sh
index 7de0e9fba328..d98bb0de90ce 100755
--- a/utilities/precheck.sh
+++ b/utilities/precheck.sh
@@ -6,7 +6,7 @@
 #
 # Copyright (C) Akira Yokosawa, 2023
 
-LC_TIME=C
+export LC_TIME=C
 
 : ${SED:=sed}
 : ${DATE:=date}
-- 
2.25.1


