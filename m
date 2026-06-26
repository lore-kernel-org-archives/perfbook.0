Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C8B380FF8
	for <perfbook@vger.kernel.org>; Fri, 26 Jun 2026 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782474120; cv=none; b=XWljF+NH5pouywIrUo2NtTcm/3J+ZxId4TDGao4mZu8lac6xsVLiWDbLm4o5s/gtMWT8JLr+hv+lBWKnNX53yDL9MJyRBjyMU1qdtB4BF9YAcbCmub/oXrup1y7053hYwuvLxj0u95zY7LWQVXMMoUWjBkX4XeR2kcGWzZj4dTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782474120; c=relaxed/simple;
	bh=YgXHWKtxbFhBQjfOsmC90kUlhBbPdPKyEzzwBSvBTVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWB9pAaIQXUQPnUHwMyAScJJ41wX7eMIAazXJyK/O7HdYNAxoOh8atjej6gGXkq7x0IWmjyNhLwS62vQ2QGexxV0MKMd4+8xbKUgbMXAFO0MTBNEQiEvEJd83uVdFZRFi/Fre2ugnmv+CqNNA90S8claFViO93PwmjlJVyKj6i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVoexm40; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVoexm40"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37defb2f231so466127a91.2
        for <perfbook@vger.kernel.org>; Fri, 26 Jun 2026 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782474118; x=1783078918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rgldxrZ8+9OZwWvM5ykwl4LR+HMQDr1YvTqnCrHCk2w=;
        b=PVoexm400B2VezM7n8kiIGp29GKtna6FfNx1fzQAlW1D/S7m1yXgcsKtgVbo4mq+41
         Kk0zsM3D7wN4U/VPkSx3geXgQpoorxo5P9FezJ5aahF142LNlmSMHxTcGtYmBvrLs36r
         6uNBNUR+jPAD6gSfNxwFYRLfxsl4zb4shvNXcRrqZyA8C4t7LZacrUUQe9C0JuQSXOCi
         FI7nE96YqtApL5Tckj8ivZ2FnVLH0RBZTrUTKIgnNFOjj8MU6arFHQyN8Ny1owL/7UO9
         S0JN+KgUJyDM8jkn3DnisUVXGB/9B3Cv9t8qFVP/rfsU0WsaJF9oUjqnoz+KwXY8HR8P
         EqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782474118; x=1783078918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgldxrZ8+9OZwWvM5ykwl4LR+HMQDr1YvTqnCrHCk2w=;
        b=ZjplKczZ5wKpJx6Erdo4pAIy/Mqn1ZpAvg9bHteMRr+Oo0sY19onMLnbtRxSdmEfFS
         G/BHf2BFqIHuZmjO6LKtNRdgTngXf8sXY+Aw/VqIhjCpL0VyHfiTFgOPyjhY2/yCsOE4
         Q7ouDphY/7suuFoP1o+M/NSyj0+3dGenJZXjnsyPM63wZHx3r9/2C0JLHlRuRtO2+k4+
         qtuRfQMNYnSGZX7vYCHjQnxaXdePwP5LcRHUEL4ACLxDi7bR42y7JmguxEo7gogQiQYP
         8IYqmMZ9DKxmfj/FKJsidw0/TXjyZw1sEzXwCs/QAVG2rSYGFo40upvnMnHy4ynT97Kk
         vUbw==
X-Gm-Message-State: AOJu0YzhhAONq6nFJ9xfq3lyMvv3PAazo4JfVa5lQc34lSdvLJyIQrMj
	oKj6f6Iuuiwje3Xw5Qcao6nYBwhb1PQM9P11HC3jqJ3oMq/UDMzWC8Rr1tEDEw==
X-Gm-Gg: AfdE7cltGR8ykzQqd6pQUkCMdJzif2fMvmxA7E1rI+YkWnMFAoIw9mKpIV3aaz0cSIW
	QOudz2QQpM7LckIQzc1jwPN4dC8En29GNf34DyOaeh1Ffrj+QMa1VELifOkXZcGlwOUzntKVc2x
	S5p3eYMpjQgylD9PvcLppKioL8OVl3aW+KXyr6EP0Hmv3CBdujpNud4YnUGDlVYh4sXVeeGYk8a
	/W78Rod0zK4Sy+tVLy+yvhVcf9u738fvNUJoo0kbGErJs2SKRLO7mjCsQmDvwAtQdBtCiT7V/zw
	IUWuYV81eU3EbS449chr+Q5hQC9qzq1qynktgLhUEvoX4mIoCjWhHobub/r+N/eucdEMY980Brx
	e4nMq52/+d/WffZAy5adY38St8E7BtNe7YBfXhT6cJyBEYfm+lrgnKxJjlMMgqDyuCDdjCMV0AT
	aHWC7o5iDPT1Y+fBxGK+8EF6TBJnyHqg520LX8Y0hBE6julmwQWC6Fxb8Edg==
X-Received: by 2002:a17:90b:3810:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37dfa19c4d4mr5929079a91.1.1782474118082;
        Fri, 26 Jun 2026 04:41:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df3dfdba5sm3798815a91.9.2026.06.26.04.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:41:57 -0700 (PDT)
Message-ID: <13f9687b-df5f-4448-8a0f-b48b168419d7@gmail.com>
Date: Fri, 26 Jun 2026 20:41:56 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/2] Redefine line count format at the beginning of
 VerbatimT env
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <14878d1b-2d34-417e-a7c8-fe74c6aee08b@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <14878d1b-2d34-417e-a7c8-fe74c6aee08b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Line count format in multi-part listings is customized by
redefining fancyvrb's \theFancyVerbLine macro.

However, its definition is common to Verbatim and its derivative
envs such as VerbatimL, VerbatimN, VerbatimU, etc.

Currently, to make a definition local to a specific snippet,
it needs to be enclosed by "{ ... }" with its counterpart
VerbatimT env, which may be error prone.

Instead, add the definition to the VerbatimT env:

  \AtBeginEnvironment{VerbatimT}{%
    \renewcommand{\theFancyVerbLine}{\rmfamily\tiny \myfvline}}

, where \myfvline can be defined in front of \begin{VerbatimT}:

  \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}  % A1, A2, ...
  \begin{VerbatimT}
    ...
  \end{VerbatimT}

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 24 ++++++------------------
 perfbook-lt.tex    |  4 ++++
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 898cdf5f..46625c67 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -71,38 +71,32 @@ that would normally be used in single-threaded code.
 \begin{listing}[tb]
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny A\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
 \begin{VerbatimT}
  p = gp;
  do_something_with(p->a);
  do_something_with(p->b);
 \end{VerbatimT}
-}
 Might be transformed to:
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny B\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
 \begin{VerbatimT}
  p = gp;
  do_something_with(p->a);
  p = gp;
  do_something_with(p->b);
 \end{VerbatimT}
-}
 The compiler assumes normal variables do not spontaneously change,
 \co{do_something_with()} might use many machine registers, and this
 transformation reduces register pressure.
 But if some other thread changes \co{gp} between lines~B1 and~B3 of the
 transformed code, the values of \co{p->a} and \co{p->b} will be mismatched.
 Prevent this by using \co{rcu_dereference()} as follows:
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny C\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
 \begin{VerbatimT}
  p = rcu_dereference(gp);
  do_something_with(p->a);
  do_something_with(p->b);
 \end{VerbatimT}
-}
 \end{adjustwidth}
 \caption{Compilers Can Reload Values}
 \label{lst:defer:Compilers Can Reload Values}
@@ -111,25 +105,21 @@ Prevent this by using \co{rcu_dereference()} as follows:
 \begin{listing}[tb]
 \begin{adjustwidth}{10pt}{5pt}
 \footnotesize
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny A\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
 \begin{VerbatimT}
  p = malloc(sizeof(*p));
  p->a = compute_value();
  p->b = 42;
  gp = p;
 \end{VerbatimT}
-}
 Might be transformed to:
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny B\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
 \begin{VerbatimT}
  p = malloc(sizeof(*p));
  gp = p;
  p->a = compute_value();
  p->b = 42;
 \end{VerbatimT}
-}
 The compiler assumes normal variables are not concurrently accessed,
 and thus that the order of stores does not matter.
 If \co{compute_value()} was inlined, this transformation might produce
@@ -138,15 +128,13 @@ In this example, if some other thread loads \co{gp} immediately after
 line~B2 of the transformed code, that thread might see pre-initialization
 garbage in \co{p->a} and \co{p->b}.
 Prevent this by using \co{rcu_assign_pointer()} as follows:
-{\renewcommand{\theFancyVerbLine}{%
-  {\rmfamily\tiny C\arabic{FancyVerbLine}}}
+\renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
 \begin{VerbatimT}
  p = malloc(sizeof(*p));
  p->a = compute_value();
  p->b = 42;
  rcu_assign_pointer(gp, p);
 \end{VerbatimT}
-}
 \end{adjustwidth}
 \caption{Compilers Can Reorder Accesses}
 \label{lst:defer:Compilers Can Reorder Accesses}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index cb8299a5..f6d6efc2 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -403,6 +403,10 @@
 \BeforeBeginEnvironment{VerbatimT}{\vspace*{2pt}}
 \AfterEndEnvironment{VerbatimT}{\vspace*{-1pt}}
 \AfterEndEnvironment{adjustwidth}{\vspace*{-2pt}}
+% for custom line count format such as A1, B2, etc.
+\newcommand{\myfvline}{\arabic{FancyVerbLine}} % redefine on-the-fly
+\AtBeginEnvironment{VerbatimT}{%
+  \renewcommand{\theFancyVerbLine}{\rmfamily\tiny \myfvline}}
 
 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
-- 
2.43.0


