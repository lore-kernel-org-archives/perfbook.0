Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c1JZ+BgLsmRYNNQbXu+O7kQejb71TZbeJ/FJY+Z/3vo=;
        b=C6onUk+2JhzuwGlsQiot0etUZBhn3S+ErnUhuDgkwsY8HWxd2D4Y5jnj4dc1oOp66p
         lSEUU98vf4soZY6NujAiUrT96M5doONAYsiXcXQJEdC8gzL1K2HMq7tNoOmdeEEEQ59a
         WqX6RS3WhUzhSjqwva5T8XNiyXB1fB/prl09L7/VOiRCbPppZHOJnAkV/Vm1VeZyNcdN
         TpIwMlLOoBiWXiqOpIycdKgDysH7UGrfpnptJ68UP9fK3CzzA0YeNW3zcT7aAn3mYuB6
         c1wwe2UsRCuPh2yXOzjJNdbAAIBEgWljksXbGT/ehbJNE1glwBMIoTk/lFywrL6tg54i
         H+PQ==
Subject: Re: [PATCH v2 0/3] Toyrcu: replace plain accesses with READ_ONCE()
 and
References: <1556180994-16131-1-git-send-email-junchangwang@gmail.com>
 <95b306ce-9ddb-0ac5-ee5c-077cb4a9a27e@gmail.com>
 <20190426134342.GC3923@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <030dde15-d2c0-a77b-dcbc-ea67567c6386@gmail.com>
Date: Sat, 27 Apr 2019 23:27:25 +0900
MIME-Version: 1.0
In-Reply-To: <20190426134342.GC3923@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Junchang, Paul,

On Fri, 26 Apr 2019 06:43:42 -0700, Paul E. McKenney wrote:
> On Fri, Apr 26, 2019 at 12:38:40AM +0900, Akira Yokosawa wrote:
>> Hi Junchang,
>>
>> On Thu, 25 Apr 2019 16:29:51 +0800, Junchang Wang wrote:
>>> Hi Paul and Akira,
>>>
>>> This patch set replaces plain accesses and ACCESS_ONCE() with READ_ONCE()
>>> and WRITE_ONCE() in Toy RCU examples. I will send another patch updating
>>> tex file accordingly on top of this patch set.
>>
>> As far as accesses to rcu_gp_ctr, this patch set looks good to me.
>>
>> In updating toyrcu.tex file, I suggested to extract the snippets from
>> code under CodeSamples/defer, but some snippets in toyrcu.tex consist of
>> code from both .h and .c. Current scheme does not support such merging
>> of snippets from multiple source files.

As a matter of fact, it turns out this is actually possible.

Please see the patch below, which converts Listing B.1.

Junchang, if it is not too late, you can use the same approach to
snippets from rcu.[ch] and rcu_nest.[ch].

        Thanks, Akira

-----8<-----------------------
From 3b3c6d99bcd580385175bf2a062dcb038f0cfc9e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 27 Apr 2019 22:34:40 +0900
Subject: [PATCH] toyrcu: Convert Listing B.1 to new scheme

This commit is an example where code extracted from two source
files under CodeSamples/ is merged into a code snippet.
Extra vertical space needs to be canceled by the \vspace*{} command
between the two \input{} commands.
\fvset{firstnumber=last} is to continue line numbering.
\fvset{firstnumber=auto} restores the default setting.

Also tweak positioning option of listing environment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/rcu_lock.c |  2 ++
 CodeSamples/defer/rcu_lock.h |  2 ++
 appendix/toyrcu/toyrcu.tex   | 26 ++++----------------------
 3 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/CodeSamples/defer/rcu_lock.c b/CodeSamples/defer/rcu_lock.c
index 8d45ac89..08b87fbd 100644
--- a/CodeSamples/defer/rcu_lock.c
+++ b/CodeSamples/defer/rcu_lock.c
@@ -20,12 +20,14 @@
 
 #include "../api.h"
 #include "rcu_lock.h"
+//\begin{snippet}[labelbase=ln:defer:rcu_lock:synchronize,commandchars=\\\[\]]
 
 void synchronize_rcu(void)
 {
 	spin_lock(&rcu_gp_lock);
 	spin_unlock(&rcu_gp_lock);
 }
+//\end{snippet}
 
 #ifdef TEST
 #include "rcutorture.h"
diff --git a/CodeSamples/defer/rcu_lock.h b/CodeSamples/defer/rcu_lock.h
index 224ea0e4..bf6f9b3c 100644
--- a/CodeSamples/defer/rcu_lock.h
+++ b/CodeSamples/defer/rcu_lock.h
@@ -26,6 +26,7 @@ static void rcu_init(void)
 {
 }
 
+//\begin{snippet}[labelbase=ln:defer:rcu_lock:lock_unlock,commandchars=\\\[\]]
 static void rcu_read_lock(void)
 {
 	spin_lock(&rcu_gp_lock);
@@ -35,5 +36,6 @@ static void rcu_read_unlock(void)
 {
 	spin_unlock(&rcu_gp_lock);
 }
+//\end{snippet}
 
 extern void synchronize_rcu(void);
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index c0a45a85..f7d6ec7f 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -30,29 +30,11 @@ provides a summary and a list of desirable RCU properties.
 
 \section{Lock-Based RCU}
 \label{sec:app:toyrcu:Lock-Based RCU}
+\NoIndentAfterThis
 
-\begin{listing}[bp]
-{ \scriptsize
-\begin{verbbox}
-  1 static void rcu_read_lock(void)
-  2 {
-  3   spin_lock(&rcu_gp_lock);
-  4 }
-  5
-  6 static void rcu_read_unlock(void)
-  7 {
-  8   spin_unlock(&rcu_gp_lock);
-  9 }
- 10
- 11 void synchronize_rcu(void)
- 12 {
- 13   spin_lock(&rcu_gp_lock);
- 14   spin_unlock(&rcu_gp_lock);
- 15 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{listing}[htbp]
+\input{CodeSamples/defer/rcu_lock@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
+\input{CodeSamples/defer/rcu_lock@synchronize.fcv}\fvset{firstnumber=auto}
 \caption{Lock-Based RCU Implementation}
 \label{lst:app:toyrcu:Lock-Based RCU Implementation}
 \end{listing}
-- 
2.17.1

