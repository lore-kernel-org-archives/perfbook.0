Return-Path: <SRS0=iSjP=DU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691075468; x=1691680268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5s8Vu16CPjdegHGQu/cUkGpMURR3L+bmX/k9qYfQX0=;
        b=KddJnV9Tm8jyR5arhZrjbyAjk2a6HMFoKXvHvZG+3KEiO7BbRSUx7rimiXN0utFx2G
         HTXU7qTySx4GNV0thqAYexv+WND9XtTWahFiN6qWDXL4qES2rzIzhXEln30Pmu+anxsv
         fAloPepvnPaiAnKK3BjMJJ65ZadTiX21TrDcxQBPqz3+e/mCEbCnvy3Ng/9zd8dkfUEq
         ho1lYekg4VB45zPy6MgCp7aMtout9Uc8EKALmvL9fDNC8K2jXaFLW3xBjBLzh79pAqM7
         E+M9xg9FxbpT7HvjV4KgFsTyNWxsfaKyx67Ycjb5s5f9xkR2nsXYf/6uHCXXGf3y7qw9
         0tOQ==
Message-ID: <de01fbb9-3f03-a57a-29a2-35050aa82ba7@gmail.com>
Date: Fri, 4 Aug 2023 00:11:03 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/5] future/tm: Cite Draft Specification of
 Transactional Language Constructs for C++ version 1.1
Content-Language: en-US
References: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/tm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/tm.tex b/future/tm.tex
index 9872f6233b5e..e69850992fd2 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -623,7 +623,7 @@ in a not-yet-loaded function, possibilities include the following:
 	corresponding time delays, and also with the corresponding
 	decoration of a great many otherwise uninvolved library functions.
 	That said, the standardization effort is already in
-	progress~\cite{Ali-Reza-Adl-Tabatabai2009CppTM}.
+	progress~\cite{Ali-Reza-Adl-Tabatabai2009CppTM,Ali-Reza-Adl-Tabatabai2012CppTM}.
 \item	As above, disallow dynamic linking and loading of functions from
 	within transactions.
 \end{enumerate}
-- 
2.25.1


