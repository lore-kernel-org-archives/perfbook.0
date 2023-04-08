Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975210;
	bh=9VIo0fo3zpZeT2eXcemc83zvRT4+T3tHrzMekNbKItI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fxDFb/cRgOWzvsfIFUMzinkezUkrJ3vaVPqEVlEvRAjlhtPQb1gDcwN1/4rluoPfu
	 +Ry9HWLhrj0Gi7eObFMqHNyt1/+x7gJG/1qkB6XKGJEY3dV19zpT0XWEyPpljL1+JQ
	 x8dfpmRqWQNj6ASfGLbR5Q12Iof8X8ihCiwY8o/ZxPIYBGqhJJE8FrSEoIG0SA4Ge7
	 tQNA35ORkH69qDBWd62CKEUyFKKewFQ0aDdo2EsBf4ic05NSdMiqVZ2kQ6jyuTlvan
	 8NRwv8v5Tj8dS54wYJ9B1FK0ivB1cR1p+of/bJ/fKtJqg4eda+d+IEClOU4Ri9OCGq
	 ZPA0/2H5uMPFg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 09/12] formal/ppcmem: Add missed non-breakable spaces
Date: Sat,  8 Apr 2023 10:33:06 -0700
Message-Id: <20230408173309.5543-10-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A few sentences in ppcmem.tex are missing non-breakable spaces.  Add
those.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 9acd4dba..c3f5f943 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -110,13 +110,13 @@ Comments can be inserted between
 each is of the form
 \co{P:R=V}, where \co{P} is the process identifier, \co{R} is the register
 identifier, and \co{V} is the value.
-For example, process 0's register r3 initially contains the value~2.
+For example, process~0's register r3 initially contains the value~2.
 If the value is a variable (\co{x}, \co{y}, or \co{z} in the example)
 then the register is initialized to the address of the variable.
 It is also possible to initialize the contents of variables, for example,
 \co{x=1} initializes the value of \co{x} to~1.
 Uninitialized variables default to the value zero, so that in the
-example, \co{x}, \co{y}, and \co{z} are all initially zero.
+example, \co{x}, \co{y}, and~\co{z} are all initially zero.
 
 \Clnref{procid} provides identifiers for the two processes, so that
 the \co{0:r3=2} on \clnref{init:0} could instead have been written
-- 
2.17.1

