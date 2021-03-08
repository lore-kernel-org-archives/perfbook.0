Return-Path: <SRS0=utkl=IG=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AoWrG61bTCvsbTS5MFnUcfU+BNrwXBr5yCHDmArquEw=;
        b=eaTOk9lZzdd0VscHGnbFJdQHr3vfV71MaF5AwVkYdquxTKqkU7UfT2POoahhCidLMk
         PuRuu+i3yS0X6hgxnNue1LrV01i5cwW5EQtllmaXt7otAmOplbfJksw8Y9DsPTQkkEme
         O+uq5q5PS9YoruxwPwHCo6waHUmhxvmXCYLFga0yoE2DJt3hECTig8ndzMvo5o7z8VC6
         qmURfiG/eaIBvlJIqyjr5AAbn8+krtAQFocnufWAkeDiRAwnsCK8I7tYlmgdzl9HnINx
         qyKQoHR+qeGlUtERLnuYF0/K/EhAAUHH36zR9kFscENkjxVrPvFwmaXgrf3noPEhto7X
         mi/g==
Subject: [PATCH 4/4] bib/RCU: Spell first name of Lehman in Kung80
References: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7eb3309d-b9b0-c553-4398-5a81f85118c1@gmail.com>
Date: Mon, 8 Mar 2021 10:58:20 +0900
MIME-Version: 1.0
In-Reply-To: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 92bc3910..96f870f4 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -19,7 +19,7 @@
 }
 
 @article{Kung80,
- author="H. T. Kung and P. Lehman",
+ author="H. T. Kung and Philip L. Lehman",
  title="Concurrent Manipulation of Binary Search Trees",
  Year="1980",
  Month="September",
-- 
2.17.1


