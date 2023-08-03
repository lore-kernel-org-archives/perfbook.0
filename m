Return-Path: <SRS0=iSjP=DU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691075394; x=1691680194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wdhMeI1bX2zFmmNFNG646pcnhjgpRfzop9CaQAFkKw=;
        b=enDbxZrb5f7p89h0nuvLAsYAgPL/SX+/cQRVhpAbFJXnsO9cQ5ukz6Y/bTKz0aAVgE
         IfouJxjpEEyIJmnEYvAw06b2Z5wSkvbyEIcvlpdQzUTW9c41OaA8AX+vbFROC07BJLTc
         gF7XZeEdGQQRUVBQDqEuu7si3dEGoRfFBZVYSrCDlgKAhqhnHMPbeGSoTWfG06VMHBq1
         cHbPICKc9OCZy3WkDllpu9uATcnBnsZ/HiKocSSSjOU9X45HWTLFhBwitChSpQ0qShvN
         uCBq0R2siOnXmhDyr+qDE7YEOrjnfh3zgSYK3B7NvnD2Q/59L47m+4W4FDoF1LaJKUQq
         0f6Q==
Message-ID: <06c2dbb4-540b-c498-c0b5-64ddd1e2cde7@gmail.com>
Date: Fri, 4 Aug 2023 00:09:51 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/5] bib/TM: Add Draft Specification of
 Transactional Language Constructs for C++ Version 1.1
Content-Language: en-US
References: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

As link to the 2009 version is now broken, add an entry for the
2012 version (Version 1.1).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/TM.bib | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/bib/TM.bib b/bib/TM.bib
index 0f222647a072..2bd836769d5a 100644
--- a/bib/TM.bib
+++ b/bib/TM.bib
@@ -723,8 +723,7 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
  Year="2009",
  Month="August",
  Note="URL:
-\url{https://software.intel.com/sites/default/files/ee/47/21569} (may need to append .pdf to view after download)",
- lastchecked="November 12, 2016",
+\nolinkurl{https://software.intel.com/sites/default/files/ee/47/21569} [broken as of July 2023]",
 }
 
 @unpublished{JoeDuffy2010RetroTM,
@@ -944,6 +943,15 @@ for Programming Languages and Operating Systems (ASPLOS '09)",
  note="EE Times \url{https://www.eetimes.com/ibm-plants-transactional-memory-in-cpu/}",
 }
 
+@unpublished{Ali-Reza-Adl-Tabatabai2012CppTM,
+ author="Ali-Reza Adl-Tabatabai and Tatiana Shpeisman and Justin Gottschlich",
+ title="Draft Specification of Transactional Language Constructs for {C++} Version 1.1",
+ Year="2012",
+ Month="February",
+ Note="URL:
+\url{https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1613.pdf}",
+}
+
 @inproceedings{AlexanderMatveev2012PessimisticTM,
  author={Alexander Matveev and Nir Shavit},
  title="Towards a Fully Pessimistic {STM} Model",
-- 
2.25.1


