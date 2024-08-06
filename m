Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E25A59
	for <perfbook@vger.kernel.org>; Tue,  6 Aug 2024 04:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722916997; cv=none; b=dVdQ89OLI5bM/0+C9e4nWdbXOYq6je9vlycv/RNTqRkaPzQ/mUWtpQFMRlbVAZhhaoe0H0afEL/4ZRXBsRTl3oDScqqRc/sbqcWhnb4LdR3Sg/WHg35gxPFE1b7gez/70eHsBNe3mrM1Pql7BMiMLaCAdAclV4KbM7/D7Uf53pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722916997; c=relaxed/simple;
	bh=+COe4hez56hYafHLsTRGnX0b9lLjRRu7DXSxWp54hYs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=BjNB757yQKV5tXqh0HvGa/mmhlGRp+9XIR3ZqPjrAfzcku3ynQukcf2ZY9nZyzlthPibIx8k4Ag/0OB4fNe6p9q+x9dSyY/JO/Yau/+wybGbin6/7tskbm5Vj+X6wK3OPoM9Emsq8XurfXMb/LPcsLfSSUYXApnxRth9SQ9dTb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESrI+9oz; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESrI+9oz"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d18d4b94cso124271b3a.2
        for <perfbook@vger.kernel.org>; Mon, 05 Aug 2024 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722916996; x=1723521796; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDTF4PpE2fO1T+B2SelFmbHeGWeuNy9PCRwxYyqdLXE=;
        b=ESrI+9ozYnvPulutWodFZRMzM0sWdFUDnxomWLlZcr0vhqRqm73O933joMnGRmdqnz
         /HNLfbxVZ7A1NleBfWTa4MR6y4+NP0bFq7BL71iKWgRjdi9LqWvh+R7wI8JTvbkkt7jl
         qU1sVv1Yix78RRZATvS6G2riaeNMTxEwGXNKYQTHspKNFWv2Hw8D+IFNhxjFl46vcQIP
         VPRNacHQuYcEsJLYa6Qlf9W9tiFz8IicQ8+3gg6oT5kVnl6ojvwB+OMPlRlQz06wSD7y
         6qQjmu/wbcAw+8Ypwu7Vd5d9+BPWIPu5IuBWpT8TOrTOWKoEclbosERWxKNwEqQ92ghi
         ReIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722916996; x=1723521796;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDTF4PpE2fO1T+B2SelFmbHeGWeuNy9PCRwxYyqdLXE=;
        b=vgvIVRKPWvX4bRIsac+fFIgJ/YgBqvZYmpTbwfRiH6+LhvASewBGhhcSU8vUTha/Hh
         p3ws4jw0SVqJzZhQCt6R/9iF4MJtFGG6aLJ5dLOKtfMDdsBsXzC3gNEhSAXNmqrJ4Pec
         98hKIVL163W92vkQaLdobcI3d2UpV0YVleCC7sS3o64/m9kdAmZ8wVKp1Uy26mvC4Vih
         I7eAHLnyvlodeF7mpoc8nBI1LRHGpHIbgDxKGP+/OLutQLxbGUfF0x6TYG4gU1LP18XR
         u/qScjdytNyUavjWroGNbL9aMmXAxKcX6l0IVrT+Hs1cX5Fo5Gh9utvmWFKA69DJkqrB
         sbgg==
X-Gm-Message-State: AOJu0YyNX6wxRsmqA87AvjGEZu3sp01ARt4jzrnDZ7hhPsbnOYS4MFwr
	qbv1gmgmBks3nvBCFA5DfOKq+sqNCEe0WPStue8c/YarkmMXAFO4
X-Google-Smtp-Source: AGHT+IH7SuUbbWeICeHBlGl7Q7VYV28/8h9vUFqKeD0lzFCb/hACrhRsl4WsvweU1IcTL8Q8l1JECA==
X-Received: by 2002:a05:6a20:2444:b0:1c4:e0d3:9637 with SMTP id adf61e73a8af0-1c69969efe7mr14557448637.52.1722916995698;
        Mon, 05 Aug 2024 21:03:15 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9fc0csm6134087a12.18.2024.08.05.21.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 21:03:15 -0700 (PDT)
Message-ID: <f7f4e7b0-9843-42d3-b79f-3d18404140cc@gmail.com>
Date: Tue, 6 Aug 2024 13:03:12 +0900
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
Subject: [PATCH -perfbook 1/2] whymb: Tweak width of Table C.1 for -eb builds
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit ffdab3a2e986 ("whymb: Show "permissions" misses in C.1")
made Table C.1 too wide for -eb builds.

Add \ebresizewidth{ ... } around the table.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index e5b16677..01c6a703 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -562,6 +562,7 @@ are up to date (``V'') or not (``I'').
 \begin{table*}
 \small
 \centering
+\ebresizewidth{
 \renewcommand*{\arraystretch}{1.2}
 \rowcolors{6}{}{lightgray}
 \begin{tabular}{lclcccccc}
@@ -602,6 +603,7 @@ are up to date (``V'') or not (``I'').
 				& $-$/I & 0/S   & 0/S   & $-$/I   & I & V \\
 	\bottomrule
 \end{tabular}
+}
 \caption{Cache Coherence Example}
 \label{tab:app:whymb:Cache Coherence Example}
 \end{table*}

base-commit: 61d5f16b87eeee8897af56f5e083b464919161f8
-- 
2.34.1

