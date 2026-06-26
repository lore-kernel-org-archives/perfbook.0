Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9C13B637A
	for <perfbook@vger.kernel.org>; Fri, 26 Jun 2026 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473691; cv=none; b=IGJu7qtcqLBv8MXjN3AQpGfWJGsSzZ4nO9NlfyGjexqouVfJawMIhZUEseDKb4t6NiR7/RGU1SjNjX5dhV7z5JTwkcYTxYr7gv5wM1gvdcSl5SuRZG1JIvnLHJMfhl0Y7gvDTH9cs2HK376p0lbKSBeCnLDNvX6FVy6Tu7cfOA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473691; c=relaxed/simple;
	bh=grs7tySJGlBtgrdgyn/lpSEwj/XDhpqRV6Br2OdZLLY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Y0pzMuXtwXz09wzwBzxJVXfH3B7++zLpoLt5useiwNv5y9CXokT/tZMTellKdmvt0sF3u9f6JTtknA058q5ur8v6u8FVO4ehtGsPu+BleDu9WAg145ypf+r5XOEH/j7EJPFVLnPk3LZMZpcjHhvRn3bsg1Lbqw5b7Is01g8uQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2y63V/f; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2y63V/f"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9254669d0cso535436a12.3
        for <perfbook@vger.kernel.org>; Fri, 26 Jun 2026 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782473689; x=1783078489; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpOydvLw6QB7rW+aGHZmiVyFwwNiPQpqtTXBthI1V1Q=;
        b=q2y63V/f+X2hMDKXLRG4rCfthJ3QL0d45BcjLcPr+6ioneGcW0yZqyyI8XzYPYU8fw
         lc2CR98V7ZNiO1O7U2+RGzXYmC8dPRn5geOcmnSpT55fRZATdlYYTmA6/USVlfs5RS/m
         7JO3jnuz1FQ4vNRl2jUsWg7wK4UtreNhPqd8INMa2rdb/TeqB00ooJvjGk+EIuV8usse
         Rq4g9FvjxN6Hp4V78ujHWoXjCFpiIfZYc4PdajMmVV1N8GGgFUXuiXKrDwuhY5ZubyWq
         sgofAlFd58vF4x1hsDPTVp4hCCPBKnFwSu/rQU3D/D1uXqNDw9u4mAnGWhPf5blffVIK
         Cy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473689; x=1783078489;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hpOydvLw6QB7rW+aGHZmiVyFwwNiPQpqtTXBthI1V1Q=;
        b=fyJEoqAxtild7oouD/rcYJbb+6JZY8ba5mjlZj0NwhYjOf86qGC1pkkLyjE7xAUIAw
         2OTkhsLdj0JD7J70VDhI5D8wN2KHDTW1FP6XSlU/gBPf1CpcAc85ih6xY53ZGu8NNmaC
         zjDzP+UHtrbi4rTduHq8r0AQ68pwfC9t3YASHSrR+wTNeW9gzfDRm9Fw5oMTUpTInuOR
         vWcfviskFJ1lp8e5zokU+S8pkZ8f15D7pVgc8rpC7mrisvQh6pSBRbFtB/fodS49UzGM
         8gGZRNDNrSSYXrgDfLM3oeYEYmJWX8uBPr5Ccq7nm8X9X34T7d6VLX6lQfHo/HSNDAfk
         dhRQ==
X-Gm-Message-State: AOJu0YwL1DGxADxDaRpsdlRFMjy7kYY22WiLNFoOa16U+GQuSOB7WOUF
	hhQp/wFPzmga+Z/+AR+Q6Xdi6QjL6LoFF1m8YMi0mJgGklKPoJp5VgX51Ul0AA==
X-Gm-Gg: AfdE7cl7C6bghXqRPEIehcx/YZGvPbHcl69govu/e1PLkIAjQLkyEJWH1G4NxhORPOy
	R2KsX1fQ7zrtJfgCsKO5rLvU7VsJn1CQUZvf5ys+5/nQ5dWanw7GFcdMIGZPIEYPkMeNNxckcD3
	eQBEkB5IFGu10YkYPro+gYesUh+GWQcIoqE6CK48KWXrRwgsCdGp18780mCW18Q2OEI+rjzbBpb
	AvqivDMOaexNBp3MA42qWbnWj+Rq6rUSS3Aec/A4FQ/PpNzP8ocLrIa64v3akCoPjpBjGVweQ5R
	b2DDQIoRk+Jyw8fBTdW7CuGztM2E6itvTooXo/Fpw7OtnT5XDa2vWyiwH/b2UyDLnh1GTwACBNt
	5QZ8zxRa0gBoxsX5h1MtAvwmYvYeX+VvYGEnpOZtS4+rdMHey2KRpVdzSa8GjTyPle7mFfNzehL
	ktuNpP7+vaG+BpUTZXcEIvSNi8Hji3mGBxHxYQKmlOIaOROqWno7PenYToog==
X-Received: by 2002:a05:6a00:988:b0:845:4d71:8d15 with SMTP id d2e1a72fcca58-845b3b88d14mr7893771b3a.37.1782473688968;
        Fri, 26 Jun 2026 04:34:48 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3feb91fsm6730845b3a.15.2026.06.26.04.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:34:48 -0700 (PDT)
Message-ID: <14878d1b-2d34-417e-a7c8-fe74c6aee08b@gmail.com>
Date: Fri, 26 Jun 2026 20:34:47 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] Define macros for multi-part listings in
 preamble
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Paul said he has a plan to add listings similar to Listings 9.13
and 9.14 [1].

Move local definitions in rcuintro.tex for such multi-part listings
into preamble so that they can be used elsewhere.  Note that
"VerbatimT" and "adjustwidth" envs have vertical spacing tweaks
applied.

Link: https://lore.kernel.org/perfbook/abeb5ab5-9c0f-4948-bfcb-392c7b77c6db@paulmck-laptop/ [1]
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 52 ++++++++++++++++++----------------------------
 perfbook-lt.tex    |  6 ++++++
 2 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 6997378b..898cdf5f 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -2,10 +2,6 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
-\newcommand{\adjvspaceabove}{\vspace*{2pt}}
-\newcommand{\adjvspacebelow}{\vspace*{-1pt}}
-\newcommand{\adjvspacebottom}{\vspace*{-2pt}}
-
 \subsection{Introduction to RCU}
 \label{sec:defer:Introduction to RCU}
 
@@ -75,27 +71,24 @@ that would normally be used in single-threaded code.
 \begin{listing}[tb]
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
-\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xrightmargin=5pt}
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny A\arabic{FancyVerbLine}}}
-\adjvspaceabove%
-\begin{Verbatim}
+\begin{VerbatimT}
  p = gp;
  do_something_with(p->a);
  do_something_with(p->b);
-\end{Verbatim}
-}\adjvspacebelow
+\end{VerbatimT}
+}
 Might be transformed to:
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny B\arabic{FancyVerbLine}}}
-\adjvspaceabove%
-\begin{Verbatim}
+\begin{VerbatimT}
  p = gp;
  do_something_with(p->a);
  p = gp;
  do_something_with(p->b);
-\end{Verbatim}
-}\adjvspacebelow
+\end{VerbatimT}
+}
 The compiler assumes normal variables do not spontaneously change,
 \co{do_something_with()} might use many machine registers, and this
 transformation reduces register pressure.
@@ -104,14 +97,13 @@ transformed code, the values of \co{p->a} and \co{p->b} will be mismatched.
 Prevent this by using \co{rcu_dereference()} as follows:
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny C\arabic{FancyVerbLine}}}
-\adjvspaceabove%
-\begin{Verbatim}
+\begin{VerbatimT}
  p = rcu_dereference(gp);
  do_something_with(p->a);
  do_something_with(p->b);
-\end{Verbatim}
-}\adjvspacebelow
-\end{adjustwidth}\adjvspacebottom
+\end{VerbatimT}
+}
+\end{adjustwidth}
 \caption{Compilers Can Reload Values}
 \label{lst:defer:Compilers Can Reload Values}
 \end{listing}
@@ -119,28 +111,25 @@ Prevent this by using \co{rcu_dereference()} as follows:
 \begin{listing}[tb]
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
-\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xrightmargin=5pt}
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny A\arabic{FancyVerbLine}}}
-\adjvspaceabove%
-\begin{Verbatim}
+\begin{VerbatimT}
  p = malloc(sizeof(*p));
  p->a = compute_value();
  p->b = 42;
  gp = p;
-\end{Verbatim}
-}\adjvspacebelow
+\end{VerbatimT}
+}
 Might be transformed to:
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny B\arabic{FancyVerbLine}}}
-\adjvspaceabove%
-\begin{Verbatim}
+\begin{VerbatimT}
  p = malloc(sizeof(*p));
  gp = p;
  p->a = compute_value();
  p->b = 42;
-\end{Verbatim}
-}\adjvspacebelow
+\end{VerbatimT}
+}
 The compiler assumes normal variables are not concurrently accessed,
 and thus that the order of stores does not matter.
 If \co{compute_value()} was inlined, this transformation might produce
@@ -151,15 +140,14 @@ garbage in \co{p->a} and \co{p->b}.
 Prevent this by using \co{rcu_assign_pointer()} as follows:
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny C\arabic{FancyVerbLine}}}
-\adjvspaceabove%
-\begin{Verbatim}
+\begin{VerbatimT}
  p = malloc(sizeof(*p));
  p->a = compute_value();
  p->b = 42;
  rcu_assign_pointer(gp, p);
-\end{Verbatim}
-}\adjvspacebelow
-\end{adjustwidth}\adjvspacebottom
+\end{VerbatimT}
+}
+\end{adjustwidth}
 \caption{Compilers Can Reorder Accesses}
 \label{lst:defer:Compilers Can Reorder Accesses}
 \end{listing}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 0dc05325..cb8299a5 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -397,6 +397,12 @@
 {numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,frame=single}
 \DefineVerbatimEnvironment{VerbatimU}{Verbatim}%
 {numbers=none,xleftmargin=5pt,xrightmargin=5pt,samepage=true,frame=single}
+% for multi-part listings with explanation
+\DefineVerbatimEnvironment{VerbatimT}{Verbatim}%
+{numbers=left,numbersep=5pt,frame=single,xrightmargin=5pt}
+\BeforeBeginEnvironment{VerbatimT}{\vspace*{2pt}}
+\AfterEndEnvironment{VerbatimT}{\vspace*{-1pt}}
+\AfterEndEnvironment{adjustwidth}{\vspace*{-2pt}}
 
 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}

base-commit: a9d5892eab1e41da0c12b0b093db1ce0fb06f7d3
-- 
2.43.0

