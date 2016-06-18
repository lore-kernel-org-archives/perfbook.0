Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=eI8zY7vjWoH69RD4SCN8aNHSyQ0RvoPxFrhVrH5h64o=;
 b=uTuICGmwiF+ogeq+pC1+KoB91adcwe6FfUpBLSlUhcC9OBsz6nWMpv1dn6v63GyPc+
 NK1wee3+knVwPHM4VtEkjFK8n7cYZCTO5AYqaU+8LMqBvD1cAPYxV9pdSknkeDvASPKy
 sE9qfWRkUD3+FY8b1m1QZkUV2vjuH8H2gA2rSUdaNX72XRwvdZGoZp5I6+AmhnnzeQn7
 fvo7D9jQ9XDsElbpQdMljyHROEyhwEEcZDVOvxQvLyOcYrcy9nnUDpAFkY/5A+Uha8zW
 96hTCBqtzlY7HXYYo28Iic/j1894Pdy+kAhXTr5x7msDF7uUx+6RirgleyWTaJETUYSl
 l0XA==
Subject: [PATCH v2] cpu: Fix numbers in Performance of Mechanisms tables
References: <9b971ea3-e84c-b4e1-e75b-7c545b24f7e3@gmail.com>
 <20160615235138.GG3923@linux.vnet.ibm.com>
 <aa44a017-bd59-6961-b968-d40eadd81579@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5bf94f38-609b-c37f-4cab-458fc6de142c@gmail.com>
Date: Sat, 18 Jun 2016 11:50:53 +0900
MIME-Version: 1.0
In-Reply-To: <aa44a017-bd59-6961-b968-d40eadd81579@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3b2c58c7e7f7abe4303383437502513f948d7401 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 18 Jun 2016 10:38:57 +0900
Subject: [PATCH v2] cpu: Fix numbers in Performance of Mechanisms tables

Numbers given in 'Comms Fabric' and 'Global Comms' rows in
Table D.1 seem inconsistent.

'Comms Fabric' latency in Table 3.1 is 3 microsecond.
The latency of Infiniband DDR, which was available in 2005 (at the
time of AMD Opteron 844) is 2.5 microsecond.
'Comms Fabric' latency in Table D.1 is 4.5 microsecond.
The latency of Infiniband QDR, which was available in 2009 (at the
time of Intel X5550 (Nehalem)) is 1.3 microsecond.
These latencies are of one-way communication.
In the other rows in the tables, costs are for at least one round-
trip. So we need to double these numbers for consistency.

For 'Comms Fabric', we'd be better to use 5 microsecond in Table 3.1,
and 2.6 microsecond in Table D.1.

Of course, these numbers are for bast cases. Actual latency would
depend on the topology and the configuration of fabric.

'Global Comms' latency in Table 3.1 is 130 ms.
This is based on the speed-of-light in vacuum.
On the other hand, 'Global Comms' latency in Table D.1 is 195 ms.
This is based on the speed-of-light in optical fiber.
The number in Table D.1 is more realistic and we should use it
in both tables.

This commit fixes these inconsistencies and modifies the related
explanation in the text accordingly.

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overheads.tex | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 311c43e..bfdd711 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -126,12 +126,12 @@ This simplified sequence is just the beginning of a discipline called
 	\hline
 	CAS cache miss		&         306.0	&         510.0 \\
 	\hline
-	Comms Fabric		&       3,000\textcolor{white}{.0}
-						&       5,000\textcolor{white}{.0}
+	Comms Fabric		&       5,000\textcolor{white}{.0}
+						&       8,330\textcolor{white}{.0}
 								\\
 	\hline
-	Global Comms		& 130,000,000\textcolor{white}{.0}
-						& 216,000,000\textcolor{white}{.0}
+	Global Comms		& 195,000,000\textcolor{white}{.0}
+						& 325,000,000\textcolor{white}{.0} \\
 								\\
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
@@ -224,11 +224,11 @@ global agreement.
 	\hline
 	CAS cache miss		&          95.9	&         266.4 \\
 	\hline
-	Comms Fabric		&       4,500\textcolor{white}{.0}
-						&	7,500\textcolor{white}{.0} \\
+	Comms Fabric		&       2,600\textcolor{white}{.0}
+						&	7,220\textcolor{white}{.0} \\
 	\hline
 	Global Comms		& 195,000,000\textcolor{white}{.0}
-						& 324,000,000\textcolor{white}{.0} \\
+						& 542,000,000\textcolor{white}{.0} \\
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
@@ -264,15 +264,19 @@ I/O operations are even more expensive.
 As shown in the ``Comms Fabric'' row,
 high performance (and expensive!) communications fabric, such as
 InfiniBand or any number of proprietary interconnects, has a latency
-of roughly three microseconds, during which time five \emph{thousand}
-instructions might have been executed.
+of roughly five microseconds for an end-to-end round trip, during which
+time more than eight \emph{thousand} instructions might have been executed.
 Standards-based communications networks often require some sort of
 protocol processing, which further increases the latency.
 Of course, geographic distance also increases latency, with the
-theoretical speed-of-light latency around the world coming to
-roughly 130 \emph{milliseconds}, or more than 200 million clock
+speed-of-light through optical fiber latency around the world coming to
+roughly 195 \emph{milliseconds}, or more than 300 million clock
 cycles, as shown in the ``Global Comms'' row.

+% Reference of Infiniband latency:
+% http://www.hpcadvisorycouncil.com/events/2014/swiss-workshop/presos/Day_1/1_Mellanox.pdf
+%     page 6/76 'Leading Interconnect, Leading Performance'
+
 \QuickQuiz{}
 	These numbers are insanely large!
 	How can I possibly get my head around them?
-- 
1.9.1


