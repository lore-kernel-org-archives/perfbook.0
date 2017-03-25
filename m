Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Dg7+uOQSEoVed6E13yKZUJFI3uhZOM1bRB5n65ZCCOs=;
 b=OENRTRA2B76Q9NnSN8vUuYY9phmcUUvHlz/bLHZrJ2XTiyrvCkVpzh5jxxQbCy65dB
 oURhH+BmVy8+kSsp+rt4qu6jzvZ9NMMn39xagL3WC9jWyVKumYp1DxM6ig/znrVDNz7U
 tH58F6yQHwXAKTS+TwvlexSW23lt3nOk5bB36Tx8n+BaTX4aOxDsMhoW5wwdIz3Q//D4
 6/teoruP/ixXx3kv/FFXIrgIPDzMeB3DpE1kOOxo4ByIRO6SMGMtrBdn6ounZ8SuH2rJ
 j21dbEaTeqHGdgwYAVziXO+DFCMlBuPKTQppls8Ua+XYLUurWIlIKddb/87U6n0bgc1r
 mrkA==
Subject: [RFC PATCH 4/7] advsync: Add footnote on transitivity
References: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4428b361-49ef-ed07-3d2e-21e06b8806b3@gmail.com>
Date: Sat, 25 Mar 2017 18:39:17 +0900
MIME-Version: 1.0
In-Reply-To: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dd1379033d25ea29bb922a5bafcd8366e18249ad Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 17:44:41 +0900
Subject: [RFC PATCH 4/7] advsync: Add footnote on transitivity

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index c26e931..9b8c4c5 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2162,7 +2162,9 @@ The following list of rules summarizes the lessons of this section:

 \item	Control dependencies pair normally with other types of barriers.

-\item	Control dependencies do \emph{not} provide transitivity.
+\item	Control dependencies do \emph{not} provide transitivity.\footnote{
+		Refer to Section~\ref{sec:advsync:Transitivity} for
+		the meaning of transitivity.}
 	If you need transitivity, use \co{smp_mb()}.
 \end{enumerate}

-- 
2.7.4


