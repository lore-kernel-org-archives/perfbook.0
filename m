Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=iQeVNQ9S3x09QZIUUhYYrzwl1C/i63E3jDE86i649hg=;
 b=o1ru/Xxcl1QNqXrIkT12yZ+hUxUjvePuY2t54XBr20epH1Fv31Pw6dFzb1thlPjfQ3
 K7JVTH95/IzyS1d2H6si8f+sj7waA8PSy0UA8UpwiNaNhT4SROg8jZfoOoBCQHEzJGnc
 J6zxHAygKBM4TICVwOzwtpcHq5ubWfo9nHDq6VJsh/lxuk2fR9HyFwLoBxKzZI3S0qFV
 N4QnRXy7sLNYYVxGvS+gEN/CJBJK9CehE+bu48sbbvqZJVpY5D+jh+LNWHmDLM5+YpMZ
 9H7eIK3aJ4hU/+2y5exyRGjQtoF31zrMcWV2XmPEwBXl1UzAEvEBynjlutB1R/gygtX9
 +67w==
Subject: [PATCH] FAQ-BUILD.txt: Fix misinfomation crept in wordsmithing
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
Date: Fri, 24 Mar 2017 07:20:28 +0900
MIME-Version: 1.0
In-Reply-To: <20170323153558.GD3637@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f7c19259ce4182688d94853c7fddc092011e802b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 24 Mar 2017 07:03:54 +0900
Subject: [PATCH] FAQ-BUILD.txt: Fix misinformation crept in by wordsmithing

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Thanks for the wordsmithing.
There were a few things I want fix.
How about this patch?

                                 Thanks, Akira

 FAQ-BUILD.txt | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index c772e8f..a47eef6 100644
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
+		the TEXMFLOCAL directory rather than to the TEXFMHOME
+		directory.

 		Following is a list of links to optional packages as of
 		March 2017:
-- 
2.7.4

