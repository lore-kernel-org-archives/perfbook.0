Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975210;
	bh=WTYzaBgOYfVQNmDuxiEXsLFuX9Tm6m5BAWH8ZC2h9ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tHDBcYFZJ90Mok6JdddmYcVFYSz54a00b8Ja4INEi28mduWXwsNLLOwXq7FICVbb2
	 co/3nsVUr1QUM67XPx6dp/pj3TX/ZUBdSWtnbe3NyP9hT55U+5k0rc1kB07bUG0SNq
	 ggaRbFuCNMLGx+btVHjy99Rf0G6UIgIHVmgO8IpX4IxTUQ3ox3h1tWnSZofosyFW5o
	 jj0tVsODrK2NxKIuAHho1zsrifijjrp5/VXlaEBkQgH3KDZskeJp2AXXMW7AszKH7V
	 UDAcp/oWboBn8uYqgQk80aSTka+zw7TVPcff49lB9mPaD7SyjMKGrU6FtzI583BRnI
	 x+hVPxecWjYrg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 08/12] formal/ppcmem: Use \qco{} instead of ``\co{}''
Date: Sat,  8 Apr 2023 10:33:05 -0700
Message-Id: <20230408173309.5543-9-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A few sentences in ppcmem.tex are using ``\co{}'', which can be
shortenized with \qco{}.  Use the shorter one.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 62a45383..9acd4dba 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -65,8 +65,8 @@ discusses the implications.
 An example PowerPC litmus test for PPCMEM is shown in
 \cref{lst:formal:PPCMEM Litmus Test}.
 The ARM interface works the same way, but with \ARM\ instructions
-substituted for the Power instructions and with the initial ``PPC''
-replaced by ``ARM''.
+substituted for the Power instructions and with the initial \qco{PPC}
+replaced by \qco{ARM}.
 
 \begin{listing}
 \begin{fcvlabel}[ln:formal:PPCMEM Litmus Test]
@@ -98,8 +98,8 @@ exists						@lnlbl[assert:b]
 \end{listing}
 
 \begin{fcvref}[ln:formal:PPCMEM Litmus Test]
-In the example, \clnref{type} identifies the type of system (``ARM'' or
-``PPC'') and contains the title for the model.
+In the example, \clnref{type} identifies the type of system (\qco{ARM} or
+\co{PPC}) and contains the title for the model.
 \Clnref{altname} provides a place for an
 alternative name for the test, which you will usually want to leave
 blank as shown in the above example.
@@ -412,7 +412,7 @@ These tools do have some intrinsic limitations:
 \item	These tools are not much good for complex data structures, although
 	it is possible to create and traverse extremely simple linked
 	lists using initialization statements of the form
-	``\co{x=y; y=z; z=42;}''.
+	\qco{x=y; y=z; z=42;}.
 \item	These tools do not handle memory mapped I/O or device registers.
 	Of course, handling such things would require that they be
 	formalized, which does not appear to be in the offing.
-- 
2.17.1

