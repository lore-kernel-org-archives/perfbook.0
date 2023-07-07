Return-Path: <SRS0=XIzw=CZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688732084; x=1691324084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0Jt+UqTZ8yQJMdVP00ONWJLcF+b6J7A0rdUVfegHdk=;
        b=VWx4UXs6zSusbBfLUO0ipLlcJJ28wmsOZVYYMjaCtDan4I6bh+VNjjyFpDH0+M0yNs
         z/31zJhTdpIWeRcwqFdl94oyo3xV1M7+2KxKbtBa/4n4B2QbZ1e9Kijwoc5soai0Owgc
         JEl57B42b/4PCCeuax7uXa9vpyyRFQo3KIZ1Eea7ng8Wksrm22i3N42xqu4pPC+ZiSvV
         rTWmyNvILAtfRHOTehzv+K8EpY53YTz+8AfFsOhpu+TCcLfm1X/cXUakipyNoMy/ssbU
         NRLvEcXLRJasE13UTn5aQMuYjWYJCXcB3KKwiyzmhkZEq4HrRM7eXZ8jyIJQuZ98WrMq
         A+Kg==
Message-ID: <a2202c31-77f7-ee4f-32d0-045b4d1ce199@gmail.com>
Date: Fri, 7 Jul 2023 21:14:41 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 7/7] runlatex.sh: Amend message on out-of-date
 cleveref
Content-Language: en-US
References: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Now that we have forget about Ubuntu bionic, reword the message on
too old cleveref.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index dd62327a0b4d..ec2114afec12 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -154,8 +154,8 @@ then
 	echo "############################################################"
 	echo "### Buggy version of LaTeX package 'cleveref' detected!! ###"
 	echo "### (Known issue on Ubuntu 18.04 LTS)                    ###"
-	echo "### Please consider installing a stable version.         ###"
-	echo "### See item 10 in FAQ-BUILD.txt for further info.       ###"
+	echo "### Required TeX Live is 2019/Debian or later.           ###"
+	echo "### Consider upgrading to Ubuntu 20.04 LTS or later.     ###"
 	echo "############################################################"
 fi
 # to avoid redundant run of bibtex and pdflatex
-- 
2.25.1


