Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=jAjBxnXnj3b9j4MB7viEN7obGD4xn9I2bnRq+php+N0=;
 b=FjYdD7ygj7kqmwiqmnF9hypO8WLDHKIXEpfss8zxCYCzuSgw086FQsGxkeCvW3trYx
 DP/PzH/jntfrNzbnbswxdaCq9gAiMlKM2OtGgD5nEbEPlyTDRaXYoOjS8k/ylLI2WvU/
 9cFkHp/MZ/bydmUtVbJxFDW8sLryQTZPY4AyOiPXdJU+TCgHdqf0BCEIDtrEP6xjE4Aa
 jMilu1Ddzzew4wX1ugaeGAYFe+hwfXT/svXiGoyR9csHerUHObV3MMJI2Hp4bsSTm5ov
 ebhrBqzRNayJqWV+FmugkYtC6m5/m2yG5Md1e0fk7AHw1UN0sqb2Kf1XzRcgWBvakwfS
 CGZw==
Subject: [PATCH 2/3] Tweak oddside and evenside margins of onecolumn
References: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6de5f5be-fdea-5a40-949d-1b07b6c47a50@gmail.com>
Date: Wed, 5 Oct 2016 00:24:03 +0900
MIME-Version: 1.0
In-Reply-To: <fb8777a9-a5f2-ede7-69b6-8882f05cdb81@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From adb8dde5b698103ee789d88b09aa836f72808bb9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 3 Oct 2016 17:26:20 +0900
Subject: [PATCH 2/3] Tweak oddside and evenside margins of onecolumn

To reduce jaggy looks of odd and even pages in onecolumn layout
displayed in a PDF reader, this commit tweaks \oddsidemargin
and \evensidemargin lengths.

It keeps exact alignment of pages in double-side print.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index dd68c58..14c06f8 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -106,6 +106,8 @@
 \setlength{\textheight}{8.25in}
 \setlength{\textwidth}{4.75in}
 \setlength{\columnsep}{0in}
+\addtolength{\oddsidemargin}{0.3in}
+\addtolength{\evensidemargin}{-0.3in}
 }

 \IfHardCover{
-- 
2.7.4


