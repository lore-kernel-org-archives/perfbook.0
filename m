Return-Path: <SRS0=b9Am=FD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=B0xbBLQUnlSDl7wQW+rfWcodIFMIvvBYj6kW3Obm6lc=;
        b=DD4x3PRuwfSM5crCutvEiNSe9CO4EYTQ1bMT756VEb7IaceisTn5Hy/x6F2TUH5JAl
         ahy1MdhAmNOuBEMKkZ3suca4TBG+FCMCbjLT8moQCDQy+ByA/ZwJTHNtZTSnxH8yweC6
         +k4BL3MJaG6gvjM+VzX+Zvt7lY6JoYvFd9ssYeC3X8C62A/LRvHAdEST3u61o1v01ySp
         YHSrQf2LHj/vRkp+K5CDFRQuDWdQFfwdQcJRnVp6XNy7CacolIRnQlplbZwC14isAQSC
         gA4cm/UdzPqX+DbVEb3Ysj5f1yygHalL5SDuFTzFyu9d8/F3VVYUC8VeUzXabpyEOHeK
         11XQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] Reset footnote count of Glossary
Message-ID: <88c1c684-7821-abac-e61d-8c5a19fc66c8@gmail.com>
Date: Sun, 29 Nov 2020 23:31:32 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8c33030941001780fb1a97c0028f04fab89470f2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Nov 2020 20:03:14 +0900
Subject: [PATCH -perfbook 1/2] Reset footnote count of Glossary

Automatic reset of footnote count is disabled after \backmatter.
Manually reset it in front of \include{glossary}.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 3a611add..bc32965d 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -461,6 +461,8 @@
 \backmatter
 
 % Glossary
+%% Reset footnote count
+\setcounter{footnote}{0}
 \input{glossary.tex}
 
 % Bibliograpy
-- 
2.17.1
