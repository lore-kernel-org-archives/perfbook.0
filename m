Return-Path: <SRS0=RJRM=SE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=MXPwzfU9t9u3Zu3bhCuHO+k75CFhnJm07Gh8KdhH1Fo=;
        b=avDrhY5m4IOFTqeqZwrEqPmkhGQYKrCuomkh7wFCK1gw/zO2AHJuKEjYI24H8inYHN
         C0B+NdrSmQK0/MvHFi4BLySzcPHTI2e/rooJtxC80REeoRi96yyeH++ymIicOVxjdsYM
         GH+fW3xGHKhqcX5KA3D3edBn/sGlKySvgIYn0AkwYaqOKcwr9OEr5OyinkiuLbdmz6zu
         DEbssR7F7nQKj3LuDnWRT2vqmvONd63vHe70uyUY4ZQyjLz4h1O33m/eH04qWGlgYHET
         W8tA+HFejjAW8PNVZfW6uERdXjUwQG8lBPmB5dbmv/2ZB3mWJs8SMkKe4KXTjXVACZ9J
         PzBg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] glossary: Tweak indexing macro
Message-ID: <93da8b35-d595-6638-93b5-b081f2dfc871@gmail.com>
Date: Thu, 20 Jan 2022 09:28:59 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fix some of indexing tags so that they can co-exist with existing
index items.

Fixes: 4e91046e35c9 ("glossary: Additions from index, A-E")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 glossary.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/glossary.tex b/glossary.tex
index 6c1c71e1..84472a9b 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -9,7 +9,7 @@
 	        David~Levary~et~al.}}
 
 \begin{description}
-\item[\IXG{Amdahl's Law}:]
+\item[\IXGr{Amdahl's Law}:]
 	If sufficient numbers of CPUs are used to run a job that has both
 	a sequential portion and a concurrent portion, performance and
 	scalability will be limited by the overhead of the sequential
@@ -228,7 +228,7 @@
 	increase the overall cost of the computation, resulting in
 	linear speedups as threads are added (assuming sufficient
 	CPUs are available).
-\item[\IXG{Energy Efficiency}:]
+\item[\IXGalth{Energy Efficiency}{energy}{efficiency}:]
 	Shorthand for ``energy-efficienct use'' in which the goal is to
 	carry out a given computation with reduced energy consumption.
 	Sublinear scalabilty can be an obstacle to energy-efficient use
@@ -510,7 +510,7 @@
 	to store to that pointer.
 	More information is provided in
 	\cref{sec:memorder:Address- and Data-Dependency Difficulties}.
-\item[\IXGh{RCU Read-Side}{Critical Section}:] % @@@ Need all-caps RCU in index!
+\item[\IXGalthmr{RCU Read-Side Critical Section}{RCU read-side}{critical section}:]
 	A section of code protected by RCU, for example, beginning with
 	\co{rcu_read_lock()} and ending with \co{rcu_read_unlock()}.
 	(See ``Read-side critical section''.)

base-commit: 6abfa973f401e7b1fb696ba078376bce77126a4b
-- 
2.17.1

