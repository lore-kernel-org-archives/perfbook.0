Return-Path: <SRS0=TMph=R2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kn4oH9FfhJCxsH5giTT2BAcLTOWAZxLSgZwcIe4lg/0=;
        b=Ybi66S6saf+Xyx7pGsgRDsTgBD3JWJYQUYx4fO/WsVelAXQ2IoaJ752glpGLNuXNJW
         9awm9wb4w+q2jruN+8tT0oKgq1LlaCF9/mHDoZ8FYNCqiU7Gq+hmy3oefSEch3Rb1fXa
         2hRiAONvAc6JmtiyFdLaMvzEWjtwrVwBpl5Xxn4za4aG/fhghCnsfAOZRNLp4Ui3QMyb
         J1EBpQU3Sxw36CtPTsp2fCWA3EvWpeLK1UHPAUe1KCo/GEvM/51dUpKjLemaplWOSv36
         KWuhfhwXUnykuB8CW8EDPBDCCCLDIEiKbQShbyaiRht6NCPk984YuiW/8qtFmLa7J6Cq
         X2xg==
Subject: [PATCH -perfbook 3/5] ebook: Increase headheight to satisfy fancyhdr
References: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b9056048-9e18-5825-8c5d-31705c9002e2@gmail.com>
Date: Mon, 10 Jan 2022 20:19:51 +0900
MIME-Version: 1.0
In-Reply-To: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In ebook-sized builds, fancyhdr emits a lot of warning messages
complaining tight headheight (once per output page):

    Package fancyhdr Warning: \headheight is too small (10.84006pt):
    (fancyhdr)                Make it at least 12.0pt, for example:
    (fancyhdr)                \setlength{\headheight}{12.0pt}.
    ...

fancyhdr can be satisfied by moving 0.0165in from headsep to
headheight.

This change has very little effects in the header area (page
count position).

Fixes: 6ac88a351675 ("ebook: Print page counts on upper-right edge of page")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index cdc0acc7..563e586d 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -402,7 +402,7 @@
   \IfEbookSize {
     % From https://tex.stackexchange.com/questions/16735/latex-options-for-kindle
     \usepackage[papersize={4.5in,6.3in},margin=0.2in,footskip=0.2in,
-      headsep=0.05in,headheight=0.15in,onecolumn,twoside=false]{geometry}
+      headsep=0.0335in,headheight=0.1665in,onecolumn,twoside=false]{geometry}
     \sloppy
     \setlength{\onecolumntextwidth}{4.1in}
     \usepackage{fancyhdr}
-- 
2.17.1


