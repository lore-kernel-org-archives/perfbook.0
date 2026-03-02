Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB4038F625
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443303; cv=none; b=peF6zgBfAmszTgfjIIDSEaqIfaKcP95LcC3hq3DwgVTWVJFJCAKMiw9oD7q4QmJyMfFcwRf4NwUkw8Bv+DGBvgygwKM6mr5Bq6WsTPk6gYHPKYmBoqNb3rKaxCxykEVWIlDrMpwRA8YEFzXKGSuNBxTjtco4dgvJ0nUs4SOSWu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443303; c=relaxed/simple;
	bh=wt9c16N/Q7MIOkgiwJuQ3KnvgtxS5wRLdnkPzwJgM4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPGGuo55RCc4iXshbbJqnD5R216vrVTnhnQYZSkIecOB5jLTVY2M+NPGtbS0MsmG8D58UqjJ+j8lGmKdiLz5yebKX3s5MOsqISSthstmHhMeYf7nAazX60/w+TTPmkTFYsHBBv0QARFB0rKAcW+i+TC4T3IELqk1Lx03z2HcTdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOMbHeOh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOMbHeOh"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae4e538abdso8000035ad.3
        for <perfbook@vger.kernel.org>; Mon, 02 Mar 2026 01:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772443302; x=1773048102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHeoskMbPu/aj1RvZP+aKliMOwf+biWLSjGiXtgKShw=;
        b=eOMbHeOhyciMvRe9JCuctp2Ga0pGBCGQpADjhvx3RT7fQv8Bu4WVnfr+OERbu2I/ac
         HB0C+kndcqxpQ7UJIoc6ij+MZoDjl7fDrf1YWzqDnglW0nL1EhLTHDGKO0mGIpiEYEQH
         XHV2J+BN5fidqSrKuPECmH1Ovz1fTfJU53SzgDdJp9mcPnPhg0Xcdx50/1iegqEdYgy7
         nhTcLCpJ5MLvaKrvFngYvUhrVc8iTaiYxuc1VkAROsjKu6b7lzJ8adn0CEmCCYheHZe7
         yvUXgvMJ7fYxCJYrGFA+aAXrwHNt66pIZ5s5E032W78yMyjaWYK5klvEgtIdF0R3MLyt
         wdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443302; x=1773048102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHeoskMbPu/aj1RvZP+aKliMOwf+biWLSjGiXtgKShw=;
        b=fdxNVO7uSbDfUwoivaVR0gF+Kj83iL+ksK2GtNh0vLNM5joW8vYjTTxciy0fG3uHKi
         iolV49QGBh1dL0MUL86bhmqrwhinsZ8g+8E8FlnZyCWZ+2R+euPLN+BNd1KKG+FeglI6
         T+RE6F45vJ5owC3zDBZ1zNC3tXp6BHYYP4zZHIiVvsjQ71SddPDUfpVd0l+ozM+LeTBU
         lo69TDRawtpfi792VihXXdGpp1+akaPZJLKEpVM4uNgis+xiPCvGl/LO0N0OUEpWZcTZ
         /YKVG2e0MMtEi29l27BgeiXedDehJzRFMPPh3923EAxTZ0jKGWmiC1AZo1JtZgd1OPEN
         NFVw==
X-Gm-Message-State: AOJu0YwSOtYQVib63WWEBhtd0iRotDikMZidHEOPJr9jj6aHo1gP8svT
	4t+AiDTyBNEcKfhr6GJg/8+UYPWIBeArVZh4tBtv+LRr/qJq5rgAv8pH
X-Gm-Gg: ATEYQzzjcIrVfVXn1sGZMxyiOFEg92VkLamhOqyO7cAR3azYdXGhTIdKSLZsXj4p651
	48bvJx6hD0s8gqjfA/w/0Z/Q95oN9imJYu0pBylQdQWX5bR2ZC5C3dVfeiGnwRCMkuSibnCd3lm
	6QDPdzdkpMparVoLqtZbztfODSoJAvqtv1tSuy73tUFfed/eaU9H31cSag/8h7ZCqu6eLRUKSd7
	ctlcpXeHO0svgN2FVjoLXR117ENgW500RiekVT6/RZ4Vjho+ZrZFEjAoe7htXnT507EkQvy+iFD
	lIIujtD/ym2kUkrItZpCUwnu5ySN76XysK7ENhBCF7xX9wfFKiLsEcViK+TQZ3zG3mPSoaqIl0E
	rfJjtlwnq42fdgFczqYxGq7vUAprTkc4CW76unZc5VBxEpxEmdkQYecOa6QKc8nC0TNvrk+ikdd
	i174YPEYtIaUW+Nh5lPC/WjwEDOCVkaGdn8xQmzbJSKpIAJrOsyMLNhcn+xmt65O3lHi37
X-Received: by 2002:a17:903:1a0b:b0:2ae:4e68:1f26 with SMTP id d9443c01a7336-2ae4e6821b9mr37294395ad.32.1772443301948;
        Mon, 02 Mar 2026 01:21:41 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae496470d3sm39945085ad.15.2026.03.02.01.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:21:41 -0800 (PST)
Message-ID: <8236cea4-3a2b-4f37-9494-bd771c246be0@gmail.com>
Date: Mon, 2 Mar 2026 18:21:43 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 4/7] defer/rcuapi: Tweak column widths for long APIs
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Table 9.2 has acquired a couple of long APIs and lost some of their
tip of tails in print.

Adjust column widths and overall dimensions so that they can be
rendered properly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index e44f21e4..4587a3e3 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -146,12 +146,12 @@ API~\cite{PaulEMcKenney2024RCUAPI}.\footnote{
 \label{tab:defer:RCU Wait-to-Finish APIs}
 \scriptsize\IfEbookSize{\hspace*{-1.8in}}{\hspace*{-.125in}}
 \ebresizeverb{0.7}{
-\begin{tabularx}{8.5in}{>{\raggedright\arraybackslash}p{0.94in}
-    >{\raggedright\arraybackslash}X
-    >{\raggedright\arraybackslash}X
-    >{\raggedright\arraybackslash}p{1.1in}
-    >{\raggedright\arraybackslash}p{1.35in}
-    >{\raggedright\arraybackslash}p{1.45in}}
+\begin{tabularx}{8.5in}{>{\raggedright\arraybackslash}p{0.92in}
+    >{\raggedright\arraybackslash}p{1.37in}
+    >{\raggedright\arraybackslash}p{1.39in}
+    >{\raggedright\arraybackslash}p{1.09in}
+    >{\raggedright\arraybackslash}p{1.34in}
+    >{\raggedright\arraybackslash}p{1.44in}}
 \toprule
 &
     {\bf RCU}: Original &
@@ -170,7 +170,7 @@ API~\cite{PaulEMcKenney2024RCUAPI}.\footnote{
 {\bf Read-side critical-section markers} &
     \tco{rcu_read_lock()}~! \tco{rcu_read_unlock()}~!  ~~~~~~~~~~~~~~~~~~
     (See \cref{tab:defer:RCU Markers for Read-Side Critical Sections} for more.) &
-	\tco{srcu_read_lock()} \tco{srcu_read_unlock()} ~~~~~~~~~~~~
+	\tco{srcu_read_lock()} \tco{srcu_read_unlock()} ~~~~~~~~~~~~~~~~~
 	(See \cref{tab:defer:SRCU Markers for Read-Side Critical Sections} for more.) &
 	    Voluntary context switch in non-idle tasks. &
 		Preemption-disabled regions of code. &
@@ -188,7 +188,7 @@ API~\cite{PaulEMcKenney2024RCUAPI}.\footnote{
 		    \tco{synchronize_rcu_tasks_trace()}
 		    \tco{rcu_trace_implies_rcu_gp()} \\
 {\bf Update-side primitives (asynchronous / callback) } &
-    \tco{call_rcu()} !
+    \tco{call_rcu()} ! ~~~~~~
     \tco{call_rcu_hurry()} &
 	\tco{call_srcu()} &
 	    \tco{call_rcu_tasks()} &
-- 
2.43.0


