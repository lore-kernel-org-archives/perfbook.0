Return-Path: <SRS0=bx9V=YP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yLFzB5OpGK9NNoqAQagZ6LDSEa7wDBiV2a23lzkTsXI=;
        b=oGMJsQKgAEIbBBh5w2m8FjGMwok2zQjXxsaSvxzMw80GWQPGkhvcc2nDD7Cka14mAA
         WDi/kpMB7IbvBi1MTbx33+ZqmslxDw84fuiCvEYBl6vXAwq92H2B2UhS90arc/3O4Xbi
         f2EMw5gn2FrPfdAowE9ahx7xrLAsSuVEkEYaOj60FDWfg9pAxFuXxKAJraDFyh5cXXrU
         2gxu1CSFHnEo2zdi41zU0bx/I6RDkmOusK+wGxWT4zZ0UNW5ssuhIMSe7ua0Dd5ALNJh
         q89tp3nLa00fGv10EzYdbT8RUzZNjxfzXufR6U7aQa+VgjfHrFap1cspy8+HN6dBWgTa
         yG7w==
Subject: [PATCH v3 6/6] defer/rcuapi: Tweak horizontal spacing of wide tables
 in 1c layout
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
 <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3c269d73-207c-589f-2fce-59a67b41ff7f@gmail.com>
Date: Tue, 22 Oct 2019 20:24:21 +0900
MIME-Version: 1.0
In-Reply-To: <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cdc88c7afb93f5c9c867b474e3be14d8e9161657 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 22 Oct 2019 12:57:05 +0900
Subject: [PATCH v3 6/6] defer/rcuapi: Tweak horizontal spacing of wide tables in 1c layout

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 47bb2da2..1c9d0365 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -26,7 +26,7 @@ presents concluding remarks.
 \centering
 \caption{RCU Wait-to-Finish APIs}
 \label{tab:defer:RCU Wait-to-Finish APIs}
-\footnotesize
+\footnotesize\OneColumnHSpace{-.9in}
 \begin{tabularx}{6.5in}{>{\raggedright\arraybackslash}p{1.08in}
     >{\raggedright\arraybackslash}X
     >{\raggedright\arraybackslash}X
@@ -423,7 +423,7 @@ that Linux supports~\cite{Spraul01}.
 \begin{table*}[tb]
 \renewcommand*{\arraystretch}{1.15}
 \footnotesize
-\centering
+\centering\OneColumnHSpace{-.4in}
 \begin{tabular}{llp{2.2in}}
 \toprule
 Category &
-- 
2.17.1


