Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7E7377574
	for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 10:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210393; cv=none; b=skafmQE+c8dhyP4AxbaZ08PnGcgvTGVi+mRayqMMIhalWruB6xvMAUflmMBhUkSgbR3LAp2QnHEKVPXG/q0D3wgF5uG7t9qcuIpwABlJYcgeX43qK9P4fJbM2D7HBLmSz1JHpFNJDSWHUh6/ua2ADEOBGWOUQfkTs46D86BkNDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210393; c=relaxed/simple;
	bh=ThEWHAbIU4JpcUzMg5i4Vza2BFvGsviHWQ68MigaK6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qVqg9o8KoAe/UhpF765W1fdp2UB2GOcWv92qw4CvoI1ec7FbHkbAzbhfCuK1R6SPj8zVqsPbj6XhnrFc9jZ8qwvTTdDjF2teTvlqs0bRq++KdDnyhlGoz6uTbLW+SiMwbUEYnZF80h33MkNZREdcxzfRJ9ik98r/3MXGj+DjYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kS16QaaA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS16QaaA"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-845369f60faso3248701b3a.3
        for <perfbook@vger.kernel.org>; Tue, 23 Jun 2026 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210391; x=1782815191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGibtiUD6wK0Q6hLbXPFSqiNbzrZzg7Yc+UGSaOSpxU=;
        b=kS16QaaAql0dgMLQ1iEzjKZsV6Gyu78x+EGElTOeGvfPYr5NZNUUs9OifuSNSKPjJE
         oImlkHM7LFhCs7zGHWIZeP0NjWqytGiP9CITyD9zf2dBgLsNdYgfUJfvD4eDmxxE1Q1Y
         K9ubbKE0/BIc9adSMVTbxzB0R68M06IsR1uYbFspRkSEoyu8N+3B8gdn1DTJyYuHg3Tt
         odJ8CR8gnivGIO3kS8L7adeGyjo0BNYyKBpDnE62LBI2P+p7Czw/4s4fTK0aqEMuPpSA
         V7wi9M5rkYpgfAO5oSqAfaPUZgtNw8Loyz9O9r73+vcaPdk+p7tunanh5yWbkSOBfss4
         IPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210391; x=1782815191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGibtiUD6wK0Q6hLbXPFSqiNbzrZzg7Yc+UGSaOSpxU=;
        b=iUpQ43cgbrq+AqsgqXQj/2VOQa3YGtEsUGKTLfkcvqz/lac1ApYRvTc65cx14207WO
         G+QWqd5FESXdEPXe0iYkOJ+11+nLVN7yUPrmqYRUX6Xn0/EUEKC6h/nJuNhhOlxYei86
         6RmkfV6Fc3DQcMigTLC3lE0jEgnjse9NOLk5/xHUAIabPXgk/7bxCuLcxK08jUxOOWH3
         lsvBW9hHXwO+o0ETWJB5rX9V+BdDg4lhad80v2SVHMJxHGNR0oj7/JZA7ysDla5qLXpy
         nt1JsUbSRqcK6nTgfN37yGU5gk6//X9TqumxQf5dCSIR2umaNSCODYF92LBstXk6TamQ
         zkpw==
X-Gm-Message-State: AOJu0YxjPIcQM9S8VuAbq710jjGpwA69HJ9feDLrb3vwfnzyTy8FsVn0
	tBsBUb5k7dNjII8/flvAHSDwd+JlIsGazf2BwOYxpmPEKf3Wj2nxKFze
X-Gm-Gg: AfdE7cluC/8d1lQg/yCUuTgdamZMNFOmhu0f10McPgTZT+QZm9g6Id6HrDM2w6BCSDM
	wnPsvbgOM2ze6TNwHdUYWXw9vgxlltkZLwsH8okbL1HhRTzx29stbMUsJFKZ+yQmPOxCaKqBZcI
	xprBRFPxhh95OTLY4YBrDtEtTJfHzuTl8vp6/e1B24pg3gCtY+4gCQ8FDc/4qEqHneOvOVzgxk9
	6qjytDzG0M6c2PHzlKFLZohkSv6qdpNFstyg32vBdZShwdMBUz71FxlHzc5k5miY+dzXolQr6FQ
	kiYBOMYEW1RflStCzCbPIDhvgbGNaiVo2altJ/yGgVn+C8RklvH0jmeyngFJFtdBS2XZxiYo2Mb
	5EUK0n2t+Gf/wBT+tvbDV7Ykr/a/tTPvZaUOZhour8yQEWW4dKZaFHjArJSHagbS6O0taDXkeer
	yHJzf/f/TQYqUVzQBETA8+4ykJTJk1TqFwVnFtaxMKtZ5gwZLAtIE8MAFJKw==
X-Received: by 2002:a05:6a00:a8d:b0:845:363e:12cb with SMTP id d2e1a72fcca58-8455078ea33mr18895421b3a.1.1782210390688;
        Tue, 23 Jun 2026 03:26:30 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed9516sm10290112b3a.57.2026.06.23.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:26:30 -0700 (PDT)
Message-ID: <6cb62056-ff2f-413a-9ff5-de9eb688044f@gmail.com>
Date: Tue, 23 Jun 2026 19:26:29 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/6] defer/rcuintro: Tweak Listings 9.13 and 9.14 by
 employing fancyvrb
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5365c170-af04-466e-876b-7c220b327591@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

For better consistency in presenting code snippets, employ
fancyvrb's Verbatim env.  Automate line counting as well.

While here, do "s/-/--/" for "lines~C1-C3" as well.

(Line number labeling/referencing might be automated in the
future ...)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 96 +++++++++++++++++++++++++++-------------------
 1 file changed, 57 insertions(+), 39 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 21a99243..596f138f 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -69,64 +69,82 @@ can be implemented with a single load instruction, exactly the instruction
 that would normally be used in single-threaded code.
 
 \begin{listing}[tb]
-{ \small
-\begin{verbatim}
- A1  p = gp;
- A2  do_something_with(p->a);
- A3  do_something_with(p->b);
-\end{verbatim}
+\small
+\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xleftmargin=15pt,xrightmargin=5pt}
+{\renewcommand{\theFancyVerbLine}{%
+  {\rmfamily\tiny A\arabic{FancyVerbLine}}}
+\begin{Verbatim}
+ p = gp;
+ do_something_with(p->a);
+ do_something_with(p->b);
+\end{Verbatim}
+}
 Might be transformed to:
-\begin{verbatim}
- B1  p = gp;
- B2  do_something_with(p->a);
- B3  p = gp;
- B4  do_something_with(p->b);
-\end{verbatim}
+{\renewcommand{\theFancyVerbLine}{%
+  {\rmfamily\tiny B\arabic{FancyVerbLine}}}
+\begin{Verbatim}
+ p = gp;
+ do_something_with(p->a);
+ p = gp;
+ do_something_with(p->b);
+\end{Verbatim}
+}
 The compiler assumes normal variables do not spontaneously change,
 \co{do_something_with()} might use many machine registers, and this
 transformation reduces register pressure.
-But if some other thread changes \co{gp} between lines~1 and~3 of the
+But if some other thread changes \co{gp} between lines~B1 and~B3 of the
 transformed code, the values of \co{p->a} and \co{p->b} will be mismatched.
 Prevent this by using \co{rcu_dereference()} as follows:
-\begin{verbatim}
- C1  p = rcu_dereference(gp);
- C2  do_something_with(p->a);
- C3  do_something_with(p->b);
-\end{verbatim}
+{\renewcommand{\theFancyVerbLine}{%
+  {\rmfamily\tiny C\arabic{FancyVerbLine}}}
+\begin{Verbatim}
+ p = rcu_dereference(gp);
+ do_something_with(p->a);
+ do_something_with(p->b);
+\end{Verbatim}
 }
 \caption{Compilers Can Reload Values}
 \label{lst:defer:Compilers Can Reload Values}
 \end{listing}
 
 \begin{listing}[tb]
-{ \small
-\begin{verbatim}
- A1  p = malloc(sizeof(*p));
- A2  p->a = compute_value();
- A3  p->b = 42;
- A4  gp = p;
-\end{verbatim}
+\small
+\fvset{numbers=left,numbersep=5pt,fontsize=\scriptsize,frame=single,xleftmargin=15pt,xrightmargin=5pt}
+{\renewcommand{\theFancyVerbLine}{%
+  {\rmfamily\tiny A\arabic{FancyVerbLine}}}
+\begin{Verbatim}
+ p = malloc(sizeof(*p));
+ p->a = compute_value();
+ p->b = 42;
+ gp = p;
+\end{Verbatim}
+}
 Might be transformed to:
-\begin{verbatim}
- B1  p = malloc(sizeof(*p));
- B2  gp = p;
- B3  p->a = compute_value();
- B4  p->b = 42;
-\end{verbatim}
+{\renewcommand{\theFancyVerbLine}{%
+  {\rmfamily\tiny B\arabic{FancyVerbLine}}}
+\begin{Verbatim}
+ p = malloc(sizeof(*p));
+ gp = p;
+ p->a = compute_value();
+ p->b = 42;
+\end{Verbatim}
+}
 The compiler assumes normal variables are not concurrently accessed,
 and thus that the order of stores does not matter.
 If \co{compute_value()} was inlined, this transformation might produce
 better code.
 In this example, if some other thread loads \co{gp} immediately after
-line~2 of the transformed code, that thread might see pre-initialization
+line~B2 of the transformed code, that thread might see pre-initialization
 garbage in \co{p->a} and \co{p->b}.
 Prevent this by using \co{rcu_assign_pointer()} as follows:
-\begin{verbatim}
- C1  p = malloc(sizeof(*p));
- C2  p->a = compute_value();
- C3  p->b = 42;
- C4  rcu_assign_pointer(gp, p);
-\end{verbatim}
+{\renewcommand{\theFancyVerbLine}{%
+  {\rmfamily\tiny C\arabic{FancyVerbLine}}}
+\begin{Verbatim}
+ p = malloc(sizeof(*p));
+ p->a = compute_value();
+ p->b = 42;
+ rcu_assign_pointer(gp, p);
+\end{Verbatim}
 }
 \caption{Compilers Can Reorder Accesses}
 \label{lst:defer:Compilers Can Reorder Accesses}
@@ -146,7 +164,7 @@ This transformation would fatally confuse any implementation of
 \co{do_something_with()} that assumed that it was being passed values
 from the same structure.
 To prevent this transformation, use \co{rcu_dereference()} as
-shown on lines~C1-C3 of this listing, thus informing the compiler of the
+shown on lines~C1--C3 of this listing, thus informing the compiler of the
 possibility of concurrent updates to \co{gp}.
 
 To see the need for \co{rcu_assign_pointer()}, please see lines~A1--A4 of
-- 
2.43.0


