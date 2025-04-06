Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A419C546
	for <perfbook@vger.kernel.org>; Sun,  6 Apr 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743935330; cv=none; b=rdoAPH03MzkZDA1gqAs7EGaOxWGNcEmsLWLy1TD7w3Duq+BEVzBwox5h9q36JSERMqZy3gz6NPd2nvJgOvN09qbh1LNRunawr+EshdWrXJwWEN5WcGaEixc+b3qmm8oMYcyT/0CtxUpO/cHFaxrPAMlSWPD2A5REj5EmwX1lqDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743935330; c=relaxed/simple;
	bh=mKcn76ZkP72n9ozudhb0ZozPJwx/OVm3UAl7EnuSaUI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=CHBcGbPb3fSZsTHml5wapcuJV4EyR2A+uuSr6i1bM2T4cIqtxITTPjH1inI5pfBWIp3pE6XHHBXZI1il/SnPnftosJr5CsYN6RirEY9L8cjol5Uq5m38KpwGPPwE9Bqp8Jf7gN6tl4fanmBIBG4wRMW+FzGEohv0+pE0DJkxUxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLJGMrwM; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLJGMrwM"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736c1138ae5so3328725b3a.3
        for <perfbook@vger.kernel.org>; Sun, 06 Apr 2025 03:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743935328; x=1744540128; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+gXzxORU5irqFUo0Se9pkN6Ag/U6/7eP3esNksc0MA=;
        b=BLJGMrwMhw6ZXQRrEHydVbI8IDX7ivHHougLuQ43Z7zNw9G1JRmjtC0y2cli92SStW
         U0bBjd0QnigX2vvVWKKvbupgH1VzX7b9fNBbSyhgE/Ilw7NTp0il1wQjx1kC9zisS+9U
         w0R9S/bnwgfOlAhW3XUb1AS9jAxIEUbh83Ef3Eyd8NiLa9nEEeNcgQZdOLm+S9bkaNo9
         13ofJp3sHbJqGCmhUAcXv9UYIo27zYz1SyoZrZCSzrwGA4OE9DG7NNoTBOhbECEEXwYz
         cLMfeC26z4KiMjILpieOwjKkQd+LI69fuX0jdl3POgSnIWcAyXF1wDnbEHCC0XF9kTOn
         JdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743935328; x=1744540128;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+gXzxORU5irqFUo0Se9pkN6Ag/U6/7eP3esNksc0MA=;
        b=nx/nTviPFIV8xI1auR5Nz1HytFwhe2rRRtknrDgpPqJ9NVcwz/enGmk1PRmfheo4k4
         bBz5af5ZjNxEpquSWRJMKz8GKGgV6Mb6h1+qS/MYfgH7UDU2UPmp4ojgXNKaRxQE2bqa
         8rkMrHdmIBThzLfBEdFiajlnQWFpKnJnG7aMxFpI+58Ic8/pW+lOi6mLfo3Y/LSfrAST
         FUA0q84+RQc4GumsRfhhqenwOWrpq4dQgEf/MS0qTRqm9AK21jzewiyz5oT2eabZxD7s
         sVKqNRn/ng6usy6Qtm0xkSCxbtWr6js5Olfpmv19N2Y7cS6CpuYFesWUk4YQooQvDQCn
         RwaA==
X-Gm-Message-State: AOJu0YykT+aF381Odk4PjZQmUA1HqHiWc88U1R+8DE6WmeEpKyHzP7d4
	cG+45fpe+vh7i3SiaaJ3X/bGvn7sgSwsIXxBAhRWt9KGua+hWJAiyE4C5A==
X-Gm-Gg: ASbGnctrqkRlAbUZD7xSJRZKeh+ADxZTNxj9kG0ey6GNkz/+ks4OP/Rwz0WRX8EETac
	XNtyxUgYg9pRXjzKRyd8M8kv+C72SrP/SVUcX+kY+g9NkU/equxGc7Qrg4G0XMwsYRe3nmz81aM
	HgBORmg9EMTG5tCoTD0FBTGX+eu66y2m0bGKUuXAgnGtHVKhzkaV7fdb6y2co86wiLz6zMU10Y+
	LKPm9Qd4xtKRZsgt8n9RVp1S+T3s6ep7AHwjT++lCQ0+OqyXNMK0BRxPWiQGkMGTvRnhRfwdWQg
	KIOK7L7WHXTcAqiaX9KhmM6NcfRC0kPJal689YRucptxvGmKOBNJsvo4fDKJGQmB+Q13miTrZxR
	6FTyq8KAtlsSqtdI=
X-Google-Smtp-Source: AGHT+IHPYOOuGrKSr3FEy6EwMluFob7QW3+KoFTM37gpJqeOFbZRsNvnW1jMBdkBar3wOqtUwtBdKQ==
X-Received: by 2002:a05:6a20:a11a:b0:1f5:a3e8:64c8 with SMTP id adf61e73a8af0-20104780695mr13805638637.36.1743935328433;
        Sun, 06 Apr 2025 03:28:48 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1bfbsm6481867b3a.4.2025.04.06.03.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 03:28:48 -0700 (PDT)
Message-ID: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>
Date: Sun, 6 Apr 2025 19:28:45 +0900
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
Subject: [PATCH -perfbook 0/3] Add index markers
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject: [PATCH -perfbook 0/3] Add index markers

Add index markers for the following terms/acronym:

  - Linux kernel memory consistency model (LKMM)
  - thermal throttling
  - multicopy atomicity

For "multicopy atomicity", instances of closely related adjective
forms are marked as well. See Patch 3/3.

        Thanks, Akira
--
Akira Yokosawa (3):
  memorder: Add index marker for "LKMM" as acronym
  cpu, SMPdesign, debugging: Add index markers for "thermal throttling"
  memorder: Add index markers for "multicopy atomicity"

 SMPdesign/criteria.tex  |  2 +-
 cpu/overview.tex        |  2 +-
 debugging/debugging.tex |  2 +-
 memorder/memorder.tex   | 36 +++++++++++++++++++++---------------
 4 files changed, 24 insertions(+), 18 deletions(-)


base-commit: dd844c5b3fcf839a409027967e05ccc3a8dbdd5c
-- 
2.34.1

