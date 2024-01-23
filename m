Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDBD5026F
	for <perfbook@vger.kernel.org>; Tue, 23 Jan 2024 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706021910; cv=none; b=GFiEjiZZsAl4nnnshGILpFwNrQ6wja9zpFxc6KYkaRO1HrtpKxWbjJH/NkVBuCJ016AjQN3GiiHtnGqt+CpxNmjIPsM3DQl9HvIeaqniWfaYFnfUPvLRebeqXnA0P2fWbKf7jFsB90uq3BqpgwyWmjFcfm5lio8wFRN5u38GE+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706021910; c=relaxed/simple;
	bh=URYiLDyHH1Wu5vAxiZnmxsQ0qu1+p3TntwYA/rVd4Mc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=exi7jZXl9Smpb2Wv5RouWx7mCan0BArDksuIo2WiYCtSo+fT0MtotGaXscmTG5IvHfYdv4kmMgvgYwQSmxdqEgMY08drJPUAX9xNepamuzLk59IAu7urz6yAdf0lljfk/77eX77M8W7stvYtlTNLoS7+megORLPFGnP7GkU9IxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWJZ2zUE; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWJZ2zUE"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2902b0e9524so2185921a91.1
        for <perfbook@vger.kernel.org>; Tue, 23 Jan 2024 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706021908; x=1706626708; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMz/sbZ+Hzd5S7Wu5wj9j8wOFc5/gVaySUywnvUCt5E=;
        b=gWJZ2zUESVjgwNeNnGPfdebw1VxhfG4HzOggYrwiNrcSthdIwtieGHO43aeeCk1C1M
         gdALIIgeo6v0z1QNPMgIU7ga0eHntpAKfywOjjkUl2vASfQU+8Gs0ckRnUYW4u1okOjA
         AN38gjgZ+t+sG+1Eq+gO0thhKkNG9hMONEaF3Qxu87PnDr1jMgYJYVDDprxqQduwI1fE
         nGCMgK4I0PIoi9ZvNFKbGXiFz9KBam0oqrR7TPH/KiycbGSS98EAsZapyGN98PvjfCOv
         0rfg7y8G9x+oJe5OZTyQq7rlb4TPxVvjJyHDf5DeB0UavXXobiZOKeH+5DxWKOZ+YzvX
         KXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706021908; x=1706626708;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UMz/sbZ+Hzd5S7Wu5wj9j8wOFc5/gVaySUywnvUCt5E=;
        b=uz1Pk24p1GOwVVIuEBy6uliQu2wdyGm6BybAv/NFBYMuL5IcpL//L1GP5Tg7rEQUxQ
         y5j/iOck3HEhX3NQqJQoSXa84mDI/ocvw8vys8mM7jK7AAOeXmJFkljXINXsvAPu7KXK
         EkOYotVztdEp4zUhEx5r/pnZvno7Wjc/BJO3JEGa9cisknfR7Xnk+SInQm4/fDUcigZl
         9dRZt8MaDTsLnMa4rs135vvk0eFB3QJ10QFpkp43GJAPMfaBgDHZ5qW0lQ6IF7X03jt2
         fpRuc4oQlQzp8IgFSa9cX+3BoLafymq4WAzSCwdXg3+ekyM+O3WWL5O/FVlj/Gudqyok
         JVSA==
X-Gm-Message-State: AOJu0YxV3S0tjjRMGMet2dBcUs7zFiS3uC91mcqoieh9Fjl4wZYBcaue
	hEd3xmtGYQSQxUnABcgcGLlXoqZoX2VfzWI+cX+dUoTaKA9xyQEo
X-Google-Smtp-Source: AGHT+IFlUZoKox+E3Gvrio4bemJr+REtR5Dk2ABRRrFsjIYG0w4g1Q71MJSejhyXgPbGkKbQIou5xA==
X-Received: by 2002:a17:90a:6286:b0:290:bd1:7d37 with SMTP id d6-20020a17090a628600b002900bd17d37mr2671368pjj.47.1706021908161;
        Tue, 23 Jan 2024 06:58:28 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id gb22-20020a17090b061600b0028ae9cb6ce0sm11959834pjb.6.2024.01.23.06.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 06:58:27 -0800 (PST)
Message-ID: <4c252203-5802-4183-af41-f6a311663df7@gmail.com>
Date: Tue, 23 Jan 2024 23:58:24 +0900
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
Subject: [PATCH -perfbook] memorder: Tweak size of figures in Answer to QQz on
 x86 memory ordering
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The use \columnwidth results in too large figures in -1c and -eb
builds.  Instead, use \twocolumwidth (\columnwidth of 2c build) and
make them more or less similarly scaled.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 1c85b22c..940ef401 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2854,7 +2854,7 @@ passage of time itself as a memory-ordering operation.
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{CodeSamples/cpu/data/coe-nvals}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{CodeSamples/cpu/data/coe-nvals}}
 \caption{x86 CPUs Can Disagree}
 \label{fig:memorder:x86 CPUs Can Disagree}
 \end{figure}
@@ -2876,7 +2876,7 @@ passage of time itself as a memory-ordering operation.
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{memorder/co-hopes}}
+\resizebox{.85\twocolumnwidth}{!}{\includegraphics{memorder/co-hopes}}
 \caption{Is Store-to-Store Counter-Temporal on x86?}
 \label{fig:memorder:Is Store-to-Store Counter-Temporal on x86?}
 \end{figure}
@@ -2899,7 +2899,7 @@ passage of time itself as a memory-ordering operation.
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{CodeSamples/cpu/data/coe}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{CodeSamples/cpu/data/coe}}
 \caption{Store-to-Store is Counter-Temporal on x86}
 \label{fig:memorder:Store-to-Store is Counter-Temporal on x86}
 \end{figure}
@@ -2922,7 +2922,7 @@ passage of time itself as a memory-ordering operation.
 
 \begin{figure}
 \centering
-\resizebox{2.2in}{!}{\includegraphics{memorder/fr-hopes}}
+\resizebox{.6\twocolumnwidth}{!}{\includegraphics{memorder/fr-hopes}}
 \caption{Is Load-to-Store Counter-Temporal on x86?}
 \label{fig:memorder:Is Load-to-Store Counter-Temporal on x86?}
 \end{figure}
@@ -2940,7 +2940,7 @@ passage of time itself as a memory-ordering operation.
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{CodeSamples/cpu/data/fre}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{CodeSamples/cpu/data/fre}}
 \caption{Load-to-Store is Counter-Temporal on x86}
 \label{fig:memorder:Load-to-Store is Counter-Temporal on x86}
 \end{figure}
@@ -2958,14 +2958,14 @@ passage of time itself as a memory-ordering operation.
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{memorder/rf-hopes}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{memorder/rf-hopes}}
 \caption{Is Store-to-Load Counter-Temporal on x86?}
 \label{fig:memorder:Is Store-to-Load Counter-Temporal on x86?}
 \end{figure}
 
 \begin{figure}
 \centering
-\resizebox{\columnwidth}{!}{\includegraphics{CodeSamples/cpu/data/rfe}}
+\resizebox{\twocolumnwidth}{!}{\includegraphics{CodeSamples/cpu/data/rfe}}
 \caption{Store-to-Load is Temporal on x86}
 \label{fig:memorder:Store-to-Load is Temporal on x86}
 \end{figure}

base-commit: 9caac64bfabf85439c480ce928dddef969354369
-- 
2.34.1
