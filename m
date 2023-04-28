Return-Path: <SRS0=YAaW=AT=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682677252; x=1685269252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAhxa4UoqtnMLuxy2x+29gEIVgVbIIMnvgmTPoAplm8=;
        b=XBL/J3DTFDqfGtvm/3ovVCFY9s7vq4xFT5FlwsfdaYyJUwSB1AV1d4SRYrZvK12u1r
         c9wt9sNW5H3Ewqy8uiGtEqCaA9s/57PqErMf/KZ4qP+DOh23qC2LrQ8D8ccawahSzy6L
         k2CFRrPRinTez5y9fCmxthltyl6WfhmMWBY88zjqRahLC2fp1EPYCp3Vp6wyshURmAGP
         5mNhSdgaQefi0MR60su+fenxeET6ExqiDZ/eUUOCyXzYvwIPd9SAQbng4+m5bjBYexr6
         iEHSOIiwLOUrVkasUw0Se0Vk1tuRxEJr0Q4lgtlq99+f1m/MBtMt1gqpLKIyVuELU7sX
         XQZw==
Message-ID: <28d45967-fd47-45eb-5f37-b91792b428e0@gmail.com>
Date: Fri, 28 Apr 2023 19:20:46 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] toolsoftrade: Add section titles of 'API
 Members'
Content-Language: en-US
References: <f6647f14-4364-1b96-b85a-93b8fcb6766c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f6647f14-4364-1b96-b85a-93b8fcb6766c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

For proper document structure, add section titles to the converted
description lists.

Amend preceding sentences as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index ea65d6b99b29..5a38d957c19f 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1262,7 +1262,7 @@ which includes program counter and stack.
 
 The thread API is shown in
 \cref{lst:toolsoftrade:Thread API}, and members are described in the
-following sections.
+following section.
 
 \begin{listing}
 \begin{VerbatimL}[numbers=none,xleftmargin=2pt]
@@ -1277,6 +1277,8 @@ void wait_all_threads(void)
 \label{lst:toolsoftrade:Thread API}
 \end{listing}
 
+\subsubsection{API Members}
+
 \begin{description}[style=nextline]
 \item[\tco{create_thread()}]
 The \apipf{create_thread()} primitive creates a new thread,
@@ -1389,7 +1391,7 @@ as in this case they are all \co{NULL}, which is not very interesting.
 
 A good starting subset of the Linux kernel's locking API is shown in
 \cref{lst:toolsoftrade:Locking API},
-each API element being described in the following sections.
+each API element being described in the following section.
 This book's CodeSamples locking API closely follows that of the Linux kernel.
 
 \begin{listing}
@@ -1403,6 +1405,8 @@ void spin_unlock(spinlock_t *sp);
 \label{lst:toolsoftrade:Locking API}
 \end{listing}
 
+\subsubsection{API Members}
+
 \begin{description}[style=nextline]
 
 \item[\tco{spin_lock_init()}]
@@ -2524,6 +2528,8 @@ init_per_thread(name, v)
 	not they were C static variables!
 }\QuickQuizEnd
 
+\subsubsection{API Members}
+
 \begin{description}[style=nextline]
 \item[\tco{DEFINE_PER_THREAD()}]
 
-- 
2.25.1


