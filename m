Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78F1BEF9B
	for <perfbook@vger.kernel.org>; Sat,  5 Apr 2025 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743843501; cv=none; b=UGEi/QlUdQ1lkvIvyajq5/P+jFH/MMcDbQt1ZVytHRhE9+YEaJIjeUTH1WHu2q4tjVmScOXs0w2h6hyepm7v63pfm/HB1MsFmFzlmeMtKfydbj+C7Vz3TDsNDrNZAKYeJtMjqGkwxLWhtQEBrRVDpx4Yly0PbylTJgs05NVGtKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743843501; c=relaxed/simple;
	bh=ZgWTTQDWGwMhL0lV098Q+tv8C/g2p+p8O5VKX98+pSI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=UfhfUipLJa7J+JzcqSbvteEbeFVV6pwW/RcKGroIhXxQuOZMWLwZMlRHJug6mScaYljGLaEdmLbSCmi8scX+3R2HRcHZsO/mr30jlrXMq3JuHJ0tg9kMphblL+02D2mppkAec1jz5qJ4P6Lvnw03bCvT0lo1P6O0EdXSWDZDP0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htx77Sng; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htx77Sng"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so2366705a12.0
        for <perfbook@vger.kernel.org>; Sat, 05 Apr 2025 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743843500; x=1744448300; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LsqJIdwxWTBgcp7aQhPKfvGOvVLpygPdscV1EodpaM=;
        b=htx77SngI0MGiaZpd0qQraPJ5k/yDcoNZeeWlwNZbj9R0IOOE4NB0viAxM20QWjQXO
         h4Q5t/f5kZ6LsMkHZH8lx6woFOq/bfkDjX41LZu/BDNRWPmdxPS1tCWbyKg04MDuM2VC
         f1SevOsDmQdJUnMR5mIoJNT/yGTLOTMdHHPo9C2M7WxBme40NvndrHPm6YzolAkafIb0
         SnClGfHNsBHUPAtIg5Z1z5g2bF3WDi9+aTSvWrc905XZlLDrEIeKIQsyhHCOgE22lDjd
         7xWfVwp5aLBVMUcJ25AH1UPmSxK6vY5NgYfXZGH0nRSS/xgwdrcs5FGz8b27Js9Umm+D
         Vr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743843500; x=1744448300;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6LsqJIdwxWTBgcp7aQhPKfvGOvVLpygPdscV1EodpaM=;
        b=w8ja64y2dr8V0eNwjvGxr/OdV+FQbJnxmriYIri7tjwGiS6V2FyS+l0JAfUDvAkie3
         5PHdN4iX3Fmp2pfzt6qBC4eQiRzP7YPVgthLLGg/HPEJDYxxjWOfbrtwRH8jdtEidh8u
         e6i3kFondmkulIX8mWTg+jr8lwJikKJ/y/1LZp2/9WvuYi9V1HFKeGlj0QLa39zv5wg0
         Se34RnArDI3Ccqq3D4q3i2tQzHpS9Hjuazi7inKTUhykxZbvREUlQmnWC1OIK4bNuyJW
         ttPt0cpdu+cn9WwweGSqa8RvIB+6Cu93KcE6mIo0Gi/zBIvGLFBe3q9x2CDvqddMgHCn
         a+Nw==
X-Gm-Message-State: AOJu0Ywb5ZB8bQmNzrOtHu2vpID4rmQ804ETMU/rAYoEoqrJHFKyjXW+
	Z5CwpAPOeBx7/NxQxv70RSHaaZKy28Wtt8qHTeQNdp8auu0JHJaqD3WPPBXp
X-Gm-Gg: ASbGnctP/bLgK4B0o0Hi2/BTMUkJpOyPbdwJQIoL/G/G0hvmU+9uUG7qVWOHldAGaIH
	ncHW194ngR9LiuuXZdYfr9xST8IHPqpLwzzW0fvDLDZTi1iGTuy+KNdTZn+BdDrZ0OvzOwY8cN4
	s6HjAdecLfQPXtYSpzqYXUS6g02uujCm+46M2+e5ZyPke17U21kl9E3J8tfrBNrrP6zD4hwnBOo
	gDl78g92M9sv8fow3i2dck0S6UQFzGRMooRcHqYb+XtQD222su6XCW6BAw3vtMYk6JuI+C6YKHa
	SM6y4VIBTwIQ8G1w/pLR00ZLAEO8Z3iVg9SHi5e2bdZ9jdWlDLHKEQs7TTebSIEaGJDJPTbh+bS
	7oVRM3jxgeNwt/dJPNdYhshpT9w==
X-Google-Smtp-Source: AGHT+IHv9QwOoN+GbWSaJ4n6K/DdniXJ+nmtHKK+yz9KjCHYSz0mbZ64wZu1N+ajsosXzqklPhpEag==
X-Received: by 2002:a17:903:2c5:b0:224:1294:1d24 with SMTP id d9443c01a7336-22a954f9deamr29559165ad.3.1743843499700;
        Sat, 05 Apr 2025 01:58:19 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c2791sm45419785ad.80.2025.04.05.01.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 01:58:19 -0700 (PDT)
Message-ID: <775f9284-0768-4510-a5a5-1b46f4369e93@gmail.com>
Date: Sat, 5 Apr 2025 17:58:17 +0900
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
Subject: [PATCH -perfbook 1/2] CodeSamples/formal: Update rcu-test.dat for
 v6.14
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index acb29ae2..33a66ac8 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -101,3 +101,4 @@ v6.8  22018 12071 34089 35.4
 ""    22676 12095 34771 34.8
 v6.12 22834 12313 35147 35.0
 ""    22961 12414 35375 35.1
+v6.14 22107 12620 34727 36.3

base-commit: 0b760b3c35bfc8fb544c9bfa9e14b3bfc6a52998
-- 
2.34.1

