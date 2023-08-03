Return-Path: <SRS0=iSjP=DU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691075630; x=1691680430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rj6AHyYbJSGbJF7r+CJv9Q2fJ0xsHevXtzg8BN+9IN8=;
        b=fokCTkGRuZLOycjOikMG13PONqhFDA8ok8qeE+Z/iWxwzO3e4YFhBdmdO/590eMxPt
         gsyT55Du1RqtpXbVLzNWwnErEhxCjRBsvJOg3X2+k8Tbx98jpcF0ABnFRN0LawbMiDkC
         +1JOuy925quQwalwTlnhQ+CXbo6+ld9mT/s0r36j67eE1T9ZMH3FvAIFLrliPoi67PV/
         gBLV3U5pdhhhVXCQjHHiIJO+ahRESqGJu2x9POwk94/y6rTHSUpmOhsKJmiBk3ln9Dif
         +cuzzO+v6MZ/PW1p9fSDWMxpvJagf1F30Iftxe4X56RFMp7+N0CBOmlhuyGbEHyYzFDI
         K2Qg==
Message-ID: <5a658474-43b4-2467-c815-3101e35fd2f6@gmail.com>
Date: Fri, 4 Aug 2023 00:13:42 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 5/5] bib/syncrefs: Salvage URL of
 PaulEMcKenney2011SeidnerInterview
Content-Language: en-US
References: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also add URL at web.archive.org as of April 2012 in a made-up field of
"ArchiveURL".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 75c44c58399f..871a35d69454 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1935,7 +1935,10 @@ Parallel Server on UNIX",
  title="Why Is Parallel Programming So Hard",
  Year="2011",
  Month="August",
- Note="http://intelligenceinsoftware.com/feature/expert_insight/why_is_parallel_programming_so_hard/",
+ Note="Available:
+\url{https://intelligenceinsoftware.com/WhyIsParallelProgrammingSoHard/}",
+ lastchecked="August 3, 2023",
+ ArchiveURL="https://web.archive.org/web/20120428171918/http://www.intelligenceinsoftware.com/feature/expert_insight/why_is_parallel_programming_so_hard/#.T5wmq7J_r2c",
 }
 
 @unpublished{PaulEMcKenney2011WhyIsParallelProgrammingSoHard,
-- 
2.25.1


