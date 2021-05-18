Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=beLqP9Si2De4ralDgbvv0tf+W+/21OjzJRkhBdMNVL0=;
        b=bEF2waN0pHsl6JBBYQGrBBD5Gk6H0waMQyXKXL4E7t9reG/sJDx5p5lq7kBJIZTVdu
         1aICfrc3eqkJ9j2+/Q6x/RzODVYc8VmV+VGcNErG4WCUghM2UR0pR4jXo8uVd+paL9v8
         vsqVaePnDdU/4h+FhYh3Qlb28QubjJXZIP80XmfXCrd0kb+pvxJxn+bUQnF67GHakbuh
         HdfjwjVI8ZDJcYRm44q8Lbh1CPQ8aq4Kx+tlvRgSsOz7W2AYh2ZD5m8Vn1E4iV4SryrA
         ngZSpnjiqnNQMd6/rlUH/DTMsskTO0F//rdCybobu29eITkweStL2+LMgk7Rmzjg9uVF
         qgOQ==
Subject: [PATCH -perfbook 1/8] fixsvgfonts: Add pattern for 'sans-serif'
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8fc38e94-c570-ba0f-8e1d-3864cd49c152@gmail.com>
Date: Tue, 18 May 2021 21:15:42 +0900
MIME-Version: 1.0
In-Reply-To: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Recently updated .svg figures have new font-specification patterns
due to inkscape's behavior change.
Add patterns to fixsvgfonts scripts to catch them and make sure
"Nimbus Sans" fonts are embedded in .pdf.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/fixsvgfonts-urwps.sh | 2 ++
 utilities/fixsvgfonts.sh       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
index 55a5a3f2..17c30e81 100644
--- a/utilities/fixsvgfonts-urwps.sh
+++ b/utilities/fixsvgfonts-urwps.sh
@@ -9,6 +9,8 @@ sed	-e 's+family:Helvetica+family:Nimbus Sans+g' \
 	-e 's+family="Helvetica+family="Nimbus Sans+g' \
 	-e 's+family:Sans+family:Nimbus Sans+g' \
 	-e 's+cation:Sans+cation:Nimbus Sans+g' \
+	-e 's+family:sans-serif+family:Nimbus Sans+g' \
+	-e 's+cation:sans-serif+cation:Nimbus Sans+g' \
 	-e 's+family:Courier+family:Nimbus Mono PS+g' \
 	-e 's+family="Courier+family="Nimbus Mono PS+g' \
 	-e 's+family:Symbol+family:MdSymbol+g' \
diff --git a/utilities/fixsvgfonts.sh b/utilities/fixsvgfonts.sh
index 657c3001..47dbaea9 100644
--- a/utilities/fixsvgfonts.sh
+++ b/utilities/fixsvgfonts.sh
@@ -9,5 +9,7 @@ sed	-e 's+family:Helvetica+family:Nimbus Sans L+g' \
 	-e 's+family="Helvetica+family="Nimbus Sans L+g' \
 	-e 's+family:Sans+family:Nimbus Sans L+g' \
 	-e 's+cation:Sans+cation:Nimbus Sans L+g' \
+	-e 's+family:sans-serif+family:Nimbus Sans L+g' \
+	-e 's+cation:sans-serif+cation:Nimbus Sans L+g' \
 	-e 's+family:Courier+family:Nimbus Mono L+g' \
 	-e 's+family="Courier+family="Nimbus Mono L+g'
-- 
2.17.1


