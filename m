Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CcjPnSqlxVW7ZRXRo2S+n8VUTGq12RyJ9vwLx/5gWNA=;
 b=JuBhj1z8x8J3nJjbvMvXlF7Xa42UemSFK+bZlJ2gRK7eJvEyy7ma5oL17F162swYYm
 vcMmmBdgN9uVDALGDSQKPAY+f9M0/m5mcAiZwyj8QO9Jz9Akl47wqXVq0bwntDTR4cAe
 7dvzJsMXpReph7NT9frL1omdwNLkociKsm+jjXkuxLXpdv78rOQoINQSDbW5/vEkfz2V
 QcT6mlnK3DYc8liy+7T+G3xz6ltmwQG6PooDVii1PxNfH1oW3k/n6K2BLje78Nl/Y+xs
 aOhb2v4JgnzTdSUJlDJyR8rWpeWB71WVVxxRVhKGfFeVRQ3ljLc2sSMNNLa8wCSN0Mxb
 y8MA==
Subject: [PATCH 3/5] future/QC: Add narrow space in front of percent symbol
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <259ffd3d-b029-0eb7-daa1-82b9d3abdfd4@gmail.com>
Date: Sun, 25 Feb 2018 08:52:01 +0900
MIME-Version: 1.0
In-Reply-To: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8241f71e5baa65e4043bdc768b9c5ba5f10c61ae Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Feb 2018 18:29:06 +0900
Subject: [PATCH 3/5] future/QC: Add narrow space in front of percent symbol

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index d88aaac..cffc6e1 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -731,13 +731,13 @@ CX3\_4),
 are shown in
 Table~\ref{tab:future:Error Rates For IBM Five-Qubit Chip}.
 The gate per-operation fidelity is only about an order of magnitude
-off of the $10^{-4}$ threshold, and some qubits in face exceed 99.9\%
+off of the $10^{-4}$ threshold, and some qubits in face exceed 99.9\,\%
 fidelity (see Section~\ref{sec:future:Programming Model} for a list of
 the operations).
 However, reading out the value of a qubit is considerably more
-error-prone, with fidelities ranging from 95\% to 99\%.
+error-prone, with fidelities ranging from 95\,\% to 99\,\%.
 Furthermore, entangling a pair of qubits is even more error-prone,
-with fidelities ranging from 95\% to 98\%.
+with fidelities ranging from 95\,\% to 98\,\%.
 Although these fidelities are sufficient to execute some QC programs, the
 aforementioned desired error rates of $10^{-4}$ (let alone $10^{-8}$) are a
 long way off, and will likely take considerable work and time to achieve.
@@ -934,7 +934,7 @@ Alternatively, silicon-based qubits offer the prospect of
 operating temperatures that are about an order of magnitude higher than
 transmon-based devices, but these silicon devices currently suffer from
 high entanglement error rates, with fidelities ranging from
-73--89\%~\cite{TFWatson2017SiliconQubit}.
+73--89\,\%~\cite{TFWatson2017SiliconQubit}.
 However, it is early days for silicon devices, so perhaps they will
 continue improving.

-- 
2.7.4


