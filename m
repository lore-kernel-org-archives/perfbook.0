Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=jU7Ba4R/JSov3ej0j6nMmf1Nx64bsyI/M63Fk/BW2q0=;
 b=m6iyVn4rWjri+8esEsxNHpvrHRgSdhPtBFWTYV+dviAhyK0HOAIuPMcCewsoZEdJMW
 WiVzvoUatNCpVhGWBbKnqKSs7y8PPPwaWDouNBWVRQIkY7DQr30CaDV/QYGm6PAnaQq3
 UVfWOMlylGsvkMsJxDmNYR38kOUBFrtt37d+o/rxGAunSWTVopeIpN/mcs7xTE7cwAF3
 18mrIyxBMFB94/1MOLDmtmjgHN6ey1K7IU9keJe858Jk8D4qtDANvx5vLzapbLNxGZWy
 dygmCC2ptpQHBRspCMW/JKFqYzfsrLbGtUFMgLjYxF8vmcy/IGFIpFnA7ZBCpfLzm/rp
 MPSA==
Subject: [PATCH v4 1/2] FAQ-BUILD.txt: Fix misinformation crept in
 wordsmithing
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
 <20170324181239.GJ3637@linux.vnet.ibm.com>
 <18798da1-60ed-a6b4-0a7b-e53a9f3b7fc0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <68813a9b-0759-c03d-0548-711a77fdd027@gmail.com>
Date: Sat, 25 Mar 2017 08:02:32 +0900
MIME-Version: 1.0
In-Reply-To: <18798da1-60ed-a6b4-0a7b-e53a9f3b7fc0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a88379395550dfdd02f995bbfa492abba2a18578 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 24 Mar 2017 07:03:54 +0900
Subject: [PATCH v4 1/2] FAQ-BUILD.txt: Fix misinformation crept in wordsmithing

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index c772e8f..6b618b4 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -91,8 +91,8 @@
 	A.	The simplest approach is to upgrade to a recent TeX
 		distribution such as TeX Live 2016.  Upgrading your Linux
 		distribution (e.g. to Ubuntu Xenial) is one way to
-		upgrade to TeX Live 2016, and might have many other
-		benefits as well.
+		upgrade TeX Live (to 2015 on Xenial), and might	have many
+		other benefits as well.

 		However, if you prefer to manually install individual
 		packages, refer to "Method 3" in:
@@ -105,9 +105,10 @@
 			http://tex.stackexchange.com/questions/88423/

 		Note: If available, you can use the <package>.tds.zip,
-		which will automatically put the files in the right place.
-		Note that font packages should be copied to the TEXMFLOCAL
-		directory rather than to the TEXFMHOME directory.
+		which will automatically put the files in a relatively
+		right place. Note that font packages should be copied to
+		the TEXMFLOCAL directory rather than to the TEXMFHOME
+		directory.

 		Following is a list of links to optional packages as of
 		March 2017:
-- 
2.7.4


