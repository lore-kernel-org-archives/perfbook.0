Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113; h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding; bh=KCTJwyEQdF/lB8l8nVyIn1tPlKhVS3qwbOFTQp2GAsw=;
 b=euk2Qm5E2QEZUBK4vXxTal4CtcpIwFSUWOA5Z9vqmMowJU6YbboYO6vO/KypwmrSfb
 9DQeHuBsJoepGC2ZuxISCPxkyn0mOGbBhBWCOMLANtx8ku0nQkzMfyy20FnQhXQ1l6UK
 IRFHX9yfh0Ur9DBJ4E4CPUrNoPpbfzg409NI9DLW44HmVQ98JGcIPXHicUcJlcR0KwJl
 fEKs1Viquc+qTIprkyW0W3JUhseuR8KDgr6Pxx7Oc/LZwLhFJQpPubqMHrbiTj4r8q/m
 ycmWMSNcOoTc3TDdZQpEARKBadc1o38e1fQ1oQaXx6JM+Vfsi2afsBAqGpPmv1mEEzlS v1mQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] defer/refcnt: Typo fix
Message-ID: <44ecaa1a-300e-db13-aac8-c1e114db460f@gmail.com>
Date: Tue, 12 Jul 2016 00:18:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

 From 2288acdf6164253618031a044cf307067be08e9f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Jul 2016 00:13:54 +0900
Subject: [PATCH] defer/refcnt: Typo fix

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
  defer/refcnt.tex | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index a2f44a4..8dfa8fe 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -119,7 +119,7 @@
  
  Reference counting tracks the number of references to a given object in
  order to prevent that object from being prematurely freed.
-As such, it has a long an honorable history of use dating back to
+As such, it has a long and honorable history of use dating back to
  at least the early
  1960s~\cite{Weizenbaum:1963:SLP:367593.367617}.\footnote{
  	Weizenbaum discusses reference counting as if it was already
-- 
1.9.1

