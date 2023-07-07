Return-Path: <SRS0=XIzw=CZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688731592; x=1691323592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdKfX4PFkYcRvlqMlewLjKLG69XWrI6WRIHjjIcYeJ4=;
        b=F0NvLj7AxSCHSVNxRQfsk0O3hqmXTD86UFcmJDQwXnI0H67Avi2jSbSNb0xy/6o/e1
         9rTk8XFHzJ6h4hQJJDPPsGYA5r6tk27AHrYERbC+iLyoAYRq/l9BWO7mIdp0Lm3/qdok
         9cybInXPHAeL+tCgXBe16Bh3Wg3HuvvwHjkFLT+AJLX8gLArBIwbB/PFrRWwMq0U3FgP
         UIYrUnr5VxB1gRvXoFH39wSkZaibGqjOo3+5Gr7ovUhfSQeM1V2VrY891Ry5BpRWUGWD
         xlf3XZCgxEpm/23hf1A5lInlt8m1NH3ftTSFryPBU5t9S95Tq3jPU+jcLSCj770cAp5r
         x0Mw==
Message-ID: <d5c38475-b99a-32de-beb0-bbaf0b89a00d@gmail.com>
Date: Fri, 7 Jul 2023 21:06:28 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/7] Prevent warning of duplicate page identifier in
 Ebook-size builds
Content-Language: en-US
References: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In Ebook-size builds, pdfTeX complains:

    pdfTeX warning (ext4): destination with the same identifier
    (name{page.i}) has been already used, duplicate ignored

As a workaround, disable pageanchor of hyperef for titlepage in
Ebook-size builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index af60f6f2388f..4c8870a135d9 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -641,7 +641,10 @@
 
 \frontmatter
 
+\IfEbookSize{\hypersetup{pageanchor=false}}{}
 \maketitle
+\IfEbookSize{\hypersetup{pageanchor=true}}{}
+
 \IfTwoColumn{
   \onecolumn\begin{adjustwidth*}{.95in}{.8in}
   \addtolength{\parindent}{6pt}
-- 
2.25.1


