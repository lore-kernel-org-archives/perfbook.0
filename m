Return-Path: <SRS0=TMph=R2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=rr6pyEBiOfXEYX0wxWRukJeQz/iqGzAhObxpTMJ0tYs=;
        b=HnDya7NAQek27R80gsfd6qSgI87XzkrEwCIA8wv3FX6e/+igMqMt4U722onj9493bk
         Vj+whYboPtiRiENs/7CCRqHvj4KuUGuiZe7nt/l95ZPfRE8/8lCcGrTQ/J168MFxbVY6
         Ie620FWCXB5x8dKDAAWptrfkRxdHU6976NRHXsvvSnJM9bZsmVm7JhYP3yoly/GITfGD
         v5LniPuu9vmKP/Fz7XZDd2+44XWDtKKSwHAYNm9yowWcqaSYls3S+M6RHkfD0DtPfpPX
         LOqO6W0KSP4cMzpw9r3obwOfIopEwv8rCeLGdEEQNLlqO874cSS0XdJgyj7blVsf+KLP
         oC4g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/5] glossary: Tweak upper-case/lower-case in
 indexed terms
Message-ID: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
Date: Mon, 10 Jan 2022 20:16:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

For consistency, "RCU-Protected Data" and "RCU-Protected Pointer"
are better be indexed as "RCU-protected data" and
"RCU-protected pointer".

To achieve this, use \IXaltr{} and give desirable forms as
alternatives.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I suggested \IXr{}, but it was not the choice in the Glossary items.

        Thanks, Akira
--
 glossary.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/glossary.tex b/glossary.tex
index 658c9b62..06d45ee6 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -431,14 +431,14 @@
 	outside of an RCU read-side critical section.
 	Any interval of time during which all threads pass through at
 	least one quiescent state each is termed a ``grace period''.
-\item[\IXr{RCU-Protected Data}:]
+\item[\IXaltr{RCU-Protected Data}{RCU-protected data}:]
 	A block of dynamically allocated memory whose freeing will be
 	deferred such that an RCU grace period will elapse between the
 	time that there were no longer any RCU-reader-accessible pointers
 	to that block and the time that that block is freed.
 	This ensures that no RCU readers will have access to that block at
 	the time that it is freed.
-\item[\IXr{RCU-Protected Pointer}:]
+\item[\IXaltr{RCU-Protected Pointer}{RCU-protected pointer}:]
 	A pointer to RCU-protected data.
 	Such pointers must be handled carefully, for example, any reader
 	that intends to dereference an RCU-protected pointer must

base-commit: 503b84bbe1d1f5c9ee54b1d1893e52481a12092a
-- 
2.17.1

