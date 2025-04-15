Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA94027E1A7
	for <perfbook@vger.kernel.org>; Tue, 15 Apr 2025 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708210; cv=none; b=QntxSLoFd4m/go7dcGN3COsjy4su7bnMgRFze8LAOcedUf3lOiIdE/DaqMRijimdsF01c2uYcoMCQptEMhnL+IoSnSuqiMmZB4JjuLwC/5wHb0VlHqAC/+bPYknk7zIWfSrVxWCHlqXEytJAcBpb/t+3UKNcUQxrapeWC1f9SMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708210; c=relaxed/simple;
	bh=FvseIIT7buwUEp76Ty01XlTLPtHnncISLNRIITdjzOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFxfkuDrhtTSeA6OWuhgPvyfP1LP624XTMkcDPPuymlWQddkOspWq2Tl78Cmwya03uYbZWnuxKPdDi1uFtNoB2XkiTYXj7TpcTjBt37zsZeeyGJm9VGwp2TI9aT+qSwj1ywd/wYgPoiyQsSEhN7BymlAWbKPM7MNxsgZUoqhjd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeXo0xKY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeXo0xKY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22409077c06so69166355ad.1
        for <perfbook@vger.kernel.org>; Tue, 15 Apr 2025 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744708208; x=1745313008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cp7CqxJJmN7ljCOct0/5ZjlepFHyXQCljsnXObbvn7E=;
        b=TeXo0xKYoHPw/vwxxpT3Bz/9hFj81fW1pgw9FjOnNXBt0gmZoDxQkxwwDceM5n2sqG
         JRTTB99TKUShgQ9+i/w3wgWs+O0BuYzJ92YVmwI9eU2fIIPxRX4Wi7xK0FFZ+1WlZR25
         V4/R569RLXYpGjlAIHjShvYbwEwWyq6w2Ja4zsjWrt+BS7no4Tt3y8gZ/nV+TppFiZdM
         Cft3T5wi6CI8czcbRy5wtYqezarMyst3DZdfnhZlM2+0eo3R6QvVmIMBTRM6oZfdB1c2
         7v4tGGgkMot5VjRK883OntwtdYLTLd6kJFsBxqVPAvqFO2TjHH88JUwc4+lhUCIFjkIV
         psVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708208; x=1745313008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp7CqxJJmN7ljCOct0/5ZjlepFHyXQCljsnXObbvn7E=;
        b=qa432e2lzh6hTzid2QMbZjoMjjKDdSVOBds+lyoNLwqtaUbAAVZ6YZCsbrvE0CsCJD
         vRiqT1jKxydW4TjoHd9v/kfQGR2pnDWAHGXiQisVPUjfWzlv4yR5bdE4qtZ8rAN2OGLr
         NNDrNvceEdAzcj8xPPMkOPLSglUKlP876oU5zzp8QSQsaN7HFSF6mKX//ICl4XNxKhf/
         rPfRwEh5q5fERu1SANCtk7p5BbgimerwHKM2r34+56uYJmHxCKeuUdcpW4iuqep0qfEA
         FdOUcbQHEi8vu6/Sx1Wj8Va0QZVb1bPeYuOBz5mgkkhejWHXMOODAVr+BaLxJ5dItr23
         J1Aw==
X-Gm-Message-State: AOJu0YzAy6xY0s+8Ztx6bfQFYtWSXMvhPSQi2dZ21FXcNXhYSU3d5zY8
	OpYU1t4nMxgUd3tymlsGkBYtJzROyKPrg1ooAKJktjjrvCtg66zpCn7lSA==
X-Gm-Gg: ASbGnctvdtYRV5+uMvYDdff+M4cwE38/0tWBiHAV5Ues22iiYyLcIOMCWRTy8K+41eZ
	6guo055R130BgC+b8MbZaIDW3nPf8jEA2i93gcazmr24Ylj538DhFe2mI4vj0cDyitVmNSygRqx
	NFlU/T43VCHe7nv87gc/05kPt9LFjV1wR71+xzXJgk19HxVTpGKEMMsoJu/lhM1+s1NCCyFgzzt
	0Rdn7v8PtG1A5G16SCSGfz2pWlD0tlrVdYbyg8FFps9lra3h/QIl9MeWSZ0aAskw3EsE3IUxDxd
	oo+hYjXdV/CsoMemSL1/8G5E6WpJ1ph9TqA82ATfeiNXHc7P1V8lKa3PPOMLmujY6pW2JpUGYui
	yh9NTMjxkDu4=
X-Google-Smtp-Source: AGHT+IHmgsNPHV2Qu+lgtmDZmZ3qZkm5EnArX6bQOihp9g3pZ8aeXws3XXC4fU4G2LXxw1DbQnLetA==
X-Received: by 2002:a17:903:1450:b0:220:e9ef:ec98 with SMTP id d9443c01a7336-22bea4acc53mr235958125ad.19.1744708208144;
        Tue, 15 Apr 2025 02:10:08 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62ba5sm112659175ad.14.2025.04.15.02.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:10:07 -0700 (PDT)
Message-ID: <c770ed91-7a27-4da3-a003-c0607d0f90f0@gmail.com>
Date: Tue, 15 Apr 2025 18:06:30 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH perfbook 1/2] Fix \IXhmr and \IXalthmr for single-level index
 mode
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <044918d6-0b23-4e9f-91dc-14219b171548@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <044918d6-0b23-4e9f-91dc-14219b171548@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In single-level Index pages, "RCU Read-Side critical section" and
"RCU read-side critical section" are listed separately.

This is because helper macros \indexhr and \indexhmr uses #1, which
is the term to be printed in the main text.
Instead, use "#3 #2" without any uppercasing.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index e6e5e609..e977dfb8 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -220,8 +220,8 @@
 }{
 \newcommand{\indexh}[3]{\ucindex{#3 #2}}
 \newcommand{\indexhy}[3]{\ucindex{#3#2}}
-\newcommand{\indexhr}[3]{\index{#1}}
-\newcommand{\indexhmr}[3]{\index{#1}}
+\newcommand{\indexhr}[3]{\index{#3 #2}}
+\newcommand{\indexhmr}[3]{\index{#3 #2}}
 }
 
 \newcommand{\IX}[1]{\ucindex{#1}\hlindex{#1}} % put with first letter capitalized into general index
-- 
2.34.1


