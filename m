Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=39XW+42nlewl3R5JySJLpgqQAj1S4BLMKIcTQjyd4ng=;
 b=1IVLf0b9YE1EJLzUP+ifTdkth82g5CXL5JMkOCofP5yVsiu9UpayFsSf5y4UuUWO07
 sKqKVpPAfUwBX5ZJlWe1Uq3f1ZCLHW3HLPEIDJfZMkObMr21czjOxNsX9yEMrgejIf+p
 XtmNCidKC/d2pEv/m0dU9MvvqibBbFRTwKw5lYvrsGKX4dtA+ds+1In5BFdWOt1oe4hB
 oyX7hlYqaHDSOQhP2j3sQCHy/P0e9C1BjqQk1Axva4B0oOmJbfbkhjq7nZE5Q0z5TRgt
 yhs+8HFwD9E167HJWbS+Ly1wH/N6ksvQ6IDQup5+PLsKvYbaMAHE78trWIScs8aiRmyF
 oXLg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] .gitignore: Add planned empty targets
Message-ID: <37282858-f590-1eed-457e-7f825634ee9d@gmail.com>
Date: Wed, 4 May 2016 08:06:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f0be4630d38992d2f247678914c208113c437509 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Wed, 4 May 2016 07:38:30 +0900
Subject: [PATCH] .gitignore: Add planned empty targets

This change will prevent "git status" from complaining when you
switch from a planned test branch to other branches.
Note: Target names 'extraction' and 'embedfonts' are now denoted
as phony targets on the master branch. Therefore, it is safe to
change them to empty targets of the same names on the planned test
branch.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 .gitignore | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitignore b/.gitignore
index 39fd69d..18b3d63 100644
--- a/.gitignore
+++ b/.gitignore
@@ -25,6 +25,12 @@ perfbook-1c.tex
 perfbook-1c.out
 perfbook-hb.tex
 perfbook-hb.out
+qqz_first
+perfbook_aux
+perfbook-1c_aux
+perfbook-hb_aux
+extraction
+embedfonts

 RCS

-- 
1.9.1

