Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47103B7756
	for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210539; cv=none; b=LgTA9aTX9iJGuMrcBQvRPKSFs7Z8bCiGDwgqTRuF5po59A1AmIoGDAZQ0jF7BTNvzRV4ZK683Xrrc4FA+ZRbcBDFIC1hdNNEJIko9vy7DB4Gt/amNb/w86TkIOaskPUwIXECNPzpOnL7jTJFwxmPPaSt+T90vfHapQK29H/+2ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210539; c=relaxed/simple;
	bh=xvCRfd20stQnnquzL4pV3HRZxYwKQpbUUuPVlgx1LFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfWstj1FmfRB8FrvrrG9HntQrvQ6UVJ6rLCI5tDju9nO2DL/gX0xL37JsY9d8gz/+ULkGxb58L/evUjO9ujvjfR0cKrEFxbyfbrgvBORGa5FdJpkMV19wvuEMYlEws3N0Pb0kSQj5JwlMbxRYGh2WrNvWAB8nBMEk6Q0moOSya4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bH+Ezce4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bH+Ezce4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84232e83ca9so2273848b3a.2
        for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210538; x=1782815338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIHwzljnWt77/11ivgYZvECySRWAd+KhkSVXiKJ8BUQ=;
        b=bH+Ezce4Jvkx+DAxyfQesMX1KDxmBH6LCLrzWtaKiSOCGJNJe57wbU0ozH7yRwiqPl
         kyhs3PuPG65yNRWgvD1S0Z6Vrt5SbTXYG4GeRW+n6T5oCVZTVyEwN90wMUYXvrZ0HdOl
         8BvEjH4TNBlHK+8Hqx+O9Swph0Pa42bpCsRtsrOuWe5TFwGR/21C5m9txUDyKdU6QPwr
         Er95kk/zBIRtCO+zpGViSV+/FHEd+xZv3MfuTF5q4L7oqMyg/P15g354IFk6SZQ7W0pm
         vaCPwM3K7Vtef3Mf5AP9VcebvH6DaFhJSt9ikITyUfjKQ9vRoJIm4ab2N8/5GZzwDKBj
         azjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210538; x=1782815338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIHwzljnWt77/11ivgYZvECySRWAd+KhkSVXiKJ8BUQ=;
        b=o7YgXR1/nfJr/jhvRO39IdsZq6TkBtS/b8YzBDlChQDE5M3p2lt7GLJR8KDWEQZl+R
         e77Dgpuy1HJlfFJYFBF0l7464fgcoz9r+1pf4B7DSa2Pud0DkuMHIwL2me4dmH3gptIr
         WP5XMj2YzrUO8ZbLO9PtT2N//WU1oLBIEksDYKyvnDXAgrJRnYY73ovP6BEfLT1j3TIQ
         xppjqg5vct98d4r49mhZnS9InZojsWBK8jTatzl3mME5sAmHqmVxqCENA1SSy+Zns8F/
         VesJHCdPyH8cvLyDyCMYIVsto2bzd8uS3zjybQfcPhL350N+aBWDd94USLwFmu/2tOuY
         2r+w==
X-Gm-Message-State: AOJu0Yye1GO84NBSNBbnbCJd3vuB/Sls0gj4lO7+3cAV3tlvkY1VjqI/
	6akijOeXFWS5ZxPbBAkK5gHhj5o/WByFnxg8YWDWxW7wloPTypTcP5JoblE/lg==
X-Gm-Gg: AfdE7clNl2lO5tCjINbBDXqwUHX7fa+s7U1Gs6/Sr6xcU/se/12zTL9nNGZ6wP0uIQw
	aGk/hL901uMzIfPldETW656GWBAc03fY8kBYLijKUVmwC+xcfb45OTRPDWJaHrohBibh3TzDXgy
	FN6rjm3DqUnT/cDoksvmzyBLhsBrycdER7mq09EB3pCx32D2FdjN/S9x/S8VH92FcChFPtjFY2b
	A+pdwWt2f+iZRjdP0AE05SxnYNdf/l3QbDl53EzToohCGaLQjdpauK0XyE3KSEGMO7SCAW2yR5x
	AI4T8Jvd2UO7r2lbHeGJlE5iFRkM3lX03bPrySY14/8k7vnayDIYi3ah2Y70fwjUHmWpa/nNfnu
	QlDsLBoWq6Pa9c+43vFJLM6e3/IucJ4+IER6kyUbf+hvyrtEFUP2OzlxTTuOfAaURMhSlNl2Lfz
	PZYeP7CfSzSyktGAyej5OfxHPemHd5oTjp+wOhDvQddeMcquXkKwrJyyiCIw==
X-Received: by 2002:a05:6a00:4fcc:b0:842:5b63:6116 with SMTP id d2e1a72fcca58-845952490bdmr2745059b3a.7.1782210537762;
        Tue, 23 Jun 2026 03:28:57 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ec335csm10219039b3a.49.2026.06.23.03.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:28:57 -0700 (PDT)
Message-ID: <ab0c58e4-0839-4f0c-b92b-ff4cc0b079d9@gmail.com>
Date: Tue, 23 Jun 2026 19:28:56 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/6] defer/rcuintro: More tweaks for Listings 9.13
 and 9.14
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

To make text parts in those floating listings easier to distinguish
from those of main contents, fine tune their appearance by:

   1) Use \footnotesize,
   2) Widen margins, and
   3) Tweak vertical spaces above/below framed code snippets.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 596f138f..6997378b 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -2,6 +2,10 @@
 % mainfile: ../perfbook.tex
 % SPDX-License-Identifier: CC-BY-SA-3.0
 
+\newcommand{\adjvspaceabove}{\vspace*{2pt}}
+\newcommand{\adjvspacebelow}{\vspace*{-1pt}}
+\newcommand{\adjvspacebottom}{\vspace*{-2pt}}
+
 \subsection{Introduction to RCU}
 \label{sec:defer:Introduction to RCU}
 
@@ -69,26 +73,29 @@ can be implemented with a single load instruction, exactly the instruction
 that would normally be used in single-threaded code.
 
 \begin{listing}[tb]
-\small
-\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xleftmargin=15pt,xrightmargin=5pt}
+\begin{adjustwidth}{10pt}{5pt}
+\footnotesize
+\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xrightmargin=5pt}
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny A\arabic{FancyVerbLine}}}
+\adjvspaceabove%
 \begin{Verbatim}
  p = gp;
  do_something_with(p->a);
  do_something_with(p->b);
 \end{Verbatim}
-}
+}\adjvspacebelow
 Might be transformed to:
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny B\arabic{FancyVerbLine}}}
+\adjvspaceabove%
 \begin{Verbatim}
  p = gp;
  do_something_with(p->a);
  p = gp;
  do_something_with(p->b);
 \end{Verbatim}
-}
+}\adjvspacebelow
 The compiler assumes normal variables do not spontaneously change,
 \co{do_something_with()} might use many machine registers, and this
 transformation reduces register pressure.
@@ -97,38 +104,43 @@ transformed code, the values of \co{p->a} and \co{p->b} will be mismatched.
 Prevent this by using \co{rcu_dereference()} as follows:
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny C\arabic{FancyVerbLine}}}
+\adjvspaceabove%
 \begin{Verbatim}
  p = rcu_dereference(gp);
  do_something_with(p->a);
  do_something_with(p->b);
 \end{Verbatim}
-}
+}\adjvspacebelow
+\end{adjustwidth}\adjvspacebottom
 \caption{Compilers Can Reload Values}
 \label{lst:defer:Compilers Can Reload Values}
 \end{listing}
 
 \begin{listing}[tb]
-\small
-\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xleftmargin=15pt,xrightmargin=5pt}
+\begin{adjustwidth}{10pt}{5pt}
+\footnotesize
+\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xrightmargin=5pt}
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny A\arabic{FancyVerbLine}}}
+\adjvspaceabove%
 \begin{Verbatim}
  p = malloc(sizeof(*p));
  p->a = compute_value();
  p->b = 42;
  gp = p;
 \end{Verbatim}
-}
+}\adjvspacebelow
 Might be transformed to:
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny B\arabic{FancyVerbLine}}}
+\adjvspaceabove%
 \begin{Verbatim}
  p = malloc(sizeof(*p));
  gp = p;
  p->a = compute_value();
  p->b = 42;
 \end{Verbatim}
-}
+}\adjvspacebelow
 The compiler assumes normal variables are not concurrently accessed,
 and thus that the order of stores does not matter.
 If \co{compute_value()} was inlined, this transformation might produce
@@ -139,13 +151,15 @@ garbage in \co{p->a} and \co{p->b}.
 Prevent this by using \co{rcu_assign_pointer()} as follows:
 {\renewcommand{\theFancyVerbLine}{%
   {\rmfamily\tiny C\arabic{FancyVerbLine}}}
+\adjvspaceabove%
 \begin{Verbatim}
  p = malloc(sizeof(*p));
  p->a = compute_value();
  p->b = 42;
  rcu_assign_pointer(gp, p);
 \end{Verbatim}
-}
+}\adjvspacebelow
+\end{adjustwidth}\adjvspacebottom
 \caption{Compilers Can Reorder Accesses}
 \label{lst:defer:Compilers Can Reorder Accesses}
 \end{listing}
-- 
2.43.0


