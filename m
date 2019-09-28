Return-Path: <SRS0=II6t=XX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uLFouZFAIhSIIPVmdFzutzWWzjzukMSTImcj+jIGVkc=;
        b=XtJUUatAA3XZvTopMWRmz6EMr2xu2Kx3g/xw9I2OSSx/sHBlCipTRVcOFPF12cAfqb
         g0lfdSd2ZuEhOAn7yu2WFUHqR0bi1DORCvmx1I+5PXRSsbegObi2eUq+cy8y0Dbqd9cT
         pmsUl6sct/q4DnbgXOCTRWxjntO24SV/rUVS2ia/wDRbd1ssgDqlkh1T9m4AzqbNbiqt
         9+h3NRAXTvvQabBOYFn1kPbfKIeTcFkHhOg4BvP64cHGcsGSmwt7IAuN3uy2nU6IeQxV
         bBlWrWT6T84+XQtwMLudvVIaMnOVHSuI1RVCcOimIzwh/HVxYg8wnyZ4z5mc4pnky2ZI
         HiDQ==
Subject: [PATCH 4/6] ppcmem: Cite Git commit of PowerPC atomic_xxx_return fix
References: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4539d0b6-17b8-bdc0-f45f-0a3a91a27fcd@gmail.com>
Date: Sat, 28 Sep 2019 11:02:38 +0900
MIME-Version: 1.0
In-Reply-To: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9f0e3855ed4b366167248ae8a4398920c8ac3a40 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Sep 2019 21:58:20 +0900
Subject: [PATCH 4/6] ppcmem: Cite Git commit of PowerPC atomic_xxx_return fix

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/ppcmem.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index a5cb90e3..d292b7da 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -322,7 +322,8 @@ cannot happen.
 	ARM does not have this particular bug because that it places
 	\co{smp_mb()} before and after the \co{atomic_add_return()}
 	function's assembly-language implementation.
-	PowerPC no longer has this bug; it has long since been fixed.
+	PowerPC no longer has this bug; it has long since been
+	fixed~\cite{BenjaminHerrenschmidt2011:powerpc:atomic_return}.
 	Finding any other bugs that the Linux kernel might have is left
 	as an exercise for the reader.
 } \QuickQuizEnd
-- 
2.17.1


