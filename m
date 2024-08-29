Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F742B9AA
	for <perfbook@vger.kernel.org>; Thu, 29 Aug 2024 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724896958; cv=none; b=KNwxcUoIBYTSZ8HGv4/vflByqvwwuVmy+AcQIZ8phBf27NXVt790qLQAG1ryL1KhSLfL8ps0DMQt37qLQdgjZXrcKIbqKfiCQ0iy26h3K4HJjkxmdMVAdHJsdoVyWtlWyewo39HT8IE9R7MQGlc1AOOPL6O3QKKxgkR2jzjV0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724896958; c=relaxed/simple;
	bh=QptZ5K4gbCUghi4RqXLyY86Y1n312evgoyriCje8DCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ov0MgCkTba9v64rGpNhdlP/PvUgV7W4901m/0yflQFNYPVU/lwTAtv7OmdpudIy27lWob6XhmTVcNta7Tyx7nPjeGn7tThlcaGkd8xOb+vgsiZEiPE4cv7KeLx4zxaOLSWVDse8A8jGwlx4RKlNywTdAs1kVlkyKlXMBktMc/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diNUQWf2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diNUQWf2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2021c03c13aso1217385ad.1
        for <perfbook@vger.kernel.org>; Wed, 28 Aug 2024 19:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724896956; x=1725501756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9KfT9VBYrpj9OP9adHFU9NxTB2GUC0fBnN8yD+LpzRU=;
        b=diNUQWf2O78w2S4/hVq5ZrGLX8NyKnKF9Qdm3g0BXL3FefCiIGHZgZ9FVn+aVnEYCW
         Nm5XV20HhYt24VBRFPdC+Es8HHageCluRdW+wlUgK8osRbCFYdw/SDEH5LL/frr4S80s
         7HYVIPHuEQShujUfcm29t4EMQQfsGbbw9P/ftRHU07VKmiOjN7/ZW+XxOkP6qIF7V5Gu
         XFVVcJqh2Lug6TomYp1VDLBnqJDKMgoS4qWgErsQed1FUAKT7Zq71s6uuzlX7zX01DmS
         hbVjGMJu2OKYAqNw84/rB/s5GpIyXRM1J4teekHD2Z0SAZ/r5VD70ZqrNy70ha72t9Bq
         Tfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724896956; x=1725501756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KfT9VBYrpj9OP9adHFU9NxTB2GUC0fBnN8yD+LpzRU=;
        b=pJHa6hyKLkf/oJlYg4BDNbLaqtUP+0XGsCrzuPqqMfiq/N82ljOPxNGIycoXV2rUwo
         OpC6ZxoSQZ1XZFcCoqxCWaP//w8cZ3sSHQjdFKaA9MjlHQHAwUHnGNk4eVJF0y9rm/Pf
         biDbfYyqKl4uFnX6O1+Oh9EBoOfm+yQjqEQ+X3abU/9kVYh8MmJ3WSxocj8fInbKLH+9
         2L68dkI6I3dWLcT8t0Dj2LoUOo4X7fT4CIHwu4OSjP1msYiFj0sv5r8Lxp8oEOiYIAeo
         6NS5LTK8tzbIluX3e0JswncF7jfveL0qeAqRGQcbzKt1jhmFX2Rpc/Jp572fKcHRiuVJ
         9nzQ==
X-Gm-Message-State: AOJu0Yyojqi4FbPbNdG0gxdonbPKnuyyE+HVcmuV/bMyhajr76RXY+TQ
	HldXR5+m5QQpnqlj9+FCPvggkHtbXL7/haHK45VOkvU9xRyxFc8n
X-Google-Smtp-Source: AGHT+IHtktgTTF3gwqOiLobrqcNAVneK13ypxd6Y8u5p1OOWENOf1y8j7H/rtYsIw8GUGKXhJtUvTA==
X-Received: by 2002:a17:902:f60a:b0:1ff:4a01:43f7 with SMTP id d9443c01a7336-2050e97bf7bmr14666765ad.10.1724896956296;
        Wed, 28 Aug 2024 19:02:36 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515533b94sm1235245ad.168.2024.08.28.19.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 19:02:36 -0700 (PDT)
Message-ID: <eba5bd2a-92c4-494b-b5ea-c8ad310704b1@gmail.com>
Date: Thu, 29 Aug 2024 11:02:34 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 5/5] Use underline for url links in 2c builds'
 bibliography
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <964bef9a-b1d4-4316-a846-b57e304ace50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Light-blue borders around URL links mask periods at title ends in
bibliography.  Use thin black underlines instead to avoid such visual
interference.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 0fa51425..580d1f01 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -704,7 +704,7 @@
   \bibliographystyle{alphapf} % Use alpha style customized by urlbst with --inlinelinks option
 }
 \IfColorLinks{}{
-  \hypersetup{pdfborder=0 0 1,urlbordercolor=0.4 1 1}
+  \hypersetup{pdfborder=0 0 1,urlbordercolor=0 0 0,pdfborderstyle=/S/U/W .2}
 }
 \bibliography{bib/RCU,bib/WFS,bib/hw,bib/os,bib/parallelsys,bib/patterns,bib/perfmeas,bib/refs,bib/syncrefs,bib/search,bib/swtools,bib/realtime,bib/TM,bib/standards,bib/OSS,bib/maze,bib/energy,bib/QC,bib/NP,bib/memorymodel}
 \IfColorLinks{}{
-- 
2.34.1


