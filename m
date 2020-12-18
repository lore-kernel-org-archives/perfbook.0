Return-Path: <SRS0=FoK8=FW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=VDj4+mjcx/dhifaHmY8QP0cNu4Tq9OTRNCddkm2pEdM=;
        b=jGFefi+UUlDgIT4UmauB67aVQuNbY/p/kcl0HcmzatY+Mq2UsXZzkiOCz9rJhZucA+
         EYRetrZszVFx0Hbxiuk0xEl7Ajwh0JXlL3j2bmNUnySW7X2ITlnXct0oPvi691e9j2gR
         3vjyvb9+k+XYfHkkTlMn2C/NPNE6G0QnBWr/X3uHfHEY6uIGaAvmV5UEQPBO4IVWuxb3
         JDrVA0jNqgLxDJFatK4yUQ3GG90hVMI5EJQMINPJWrwjyTldHsfz1vwOnjfpmZUhP9H8
         EveqYHea+0GfvSE0HjWy/cnS67uhAvSF4aDzyzgOYd9JDkw98CqMUr5JE0hm3paYGEfW
         7viA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] bib/hw: Salvage link to OpenVMS ask_the_wizards
Message-ID: <849b13f6-88b4-d3e6-d8ff-80eac7a14845@gmail.com>
Date: Sat, 19 Dec 2020 08:26:50 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 67fa2f09fc2e18af5894e407890d60d142d8b82d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 19 Dec 2020 08:20:54 +0900
Subject: [PATCH -perfbook] bib/hw: Salvage link to OpenVMS ask_the_wizards

This Q&A has been archived at www.digiater.nl and linked from
VMS Software wiki at https://wiki.vmssoftware.com/Freeware_CD.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/hw.bib | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/bib/hw.bib b/bib/hw.bib
index b63b0622..aa9d818e 100644
--- a/bib/hw.bib
+++ b/bib/hw.bib
@@ -290,9 +290,8 @@ System Programming",
  Title="Shared Memory, Threads, Interprocess Communication",
  month="August",
  year="2001",
- note="URL:
-\nolinkurl{http://h71000.www7.hp.com/wizard/wiz_2637.html}
-[broken, November 2020]",
+ note="Zipped archive: \path{wiz_2637.txt} in
+\url{https://www.digiater.nl/openvms/freeware/v70/ask_the_wizard/wizard.zip}",
 }
 
 @unpublished{MichaelCree2010AlphaLinux,
-- 
2.17.1

