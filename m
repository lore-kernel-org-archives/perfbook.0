Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F7546456
	for <perfbook@vger.kernel.org>; Sun, 17 Dec 2023 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXpkc6Qm"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35f96476fb3so11832685ab.0
        for <perfbook@vger.kernel.org>; Sun, 17 Dec 2023 09:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702834890; x=1703439690; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/j6UHwzT3x1udus8jcWeocfjERYfY/4g3oBXRBr+Mp0=;
        b=MXpkc6QmZrwfMTTk97XdmZ/TbJzsPiTgFRutVV4D4zFgqtIUJO0Y5ruHCDlrHZrYD5
         1e7N6EamKd6gMIvRiDv2wKrkb9j+o3yhqQRPf5Vef4Khts28AElVRUAIDLza/aXc/+vg
         7soZIhs4hbjjj8RGMSvmt3hqXpO3tYRw0mO26wSjhSzxSyHITuCvPHmLdlDt9ps1AKEW
         +rrlrXm2n5/IkIfkv7Xxv/Si/eDcnBlKDiaNecuCLVyI/1atm9qKVKLXEBNFm/gKKkP1
         fzLea+iWrGNl0mWEyN58wv1W5GaQieyuaJBKVU6dfDn57rTsZW8QhYtigOSDZIRL+9Z6
         r9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702834890; x=1703439690;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/j6UHwzT3x1udus8jcWeocfjERYfY/4g3oBXRBr+Mp0=;
        b=r+3ESEAf3xxxlUOu8xLP9ceQKLqzLXv0nLRPg23PvZ4VCfxDLXYRhvbJ4B+H947eiH
         +WTWs4f7c23jNJr9PFEg2o73I2Wj5X+SMzWJLBi9QkM7MxcOpa028teZyHvZ5CqxwJHq
         2t8mRzty/5c8NRtJiuKmnIpw5Xse0nO0nH8ykxGo0kfYvhuz+ggoUlTlHUPpOigxuQ1a
         yIfLMbXUz7OSI0MqA+GFNIWLqeMSI0I9ZrxIueUC51vaxZZQFYUu1ABqt95VGMGkVDrC
         ucCaqAvzTCdAfe2wCSWbFQL8f7JMDZtrsTqja94cbXF8hgv9Yw9gMus6ZLMkyyGlhF1+
         bAvQ==
X-Gm-Message-State: AOJu0Yzqsv29KgJK5s8d5szXGuoxvtNjNkoYqYQHnkKyJ8X8xjH8MA2d
	AeN0vaP8J/6RVpSVn275gEY=
X-Google-Smtp-Source: AGHT+IGY/ME9J0IQB7TNaLoYOowOsra+udvoh2mEVx7TMJOeMQYhO/ECPB5AjsmN/RiVCqzLbw/MHA==
X-Received: by 2002:a05:6e02:1d0f:b0:35d:6ac4:a430 with SMTP id i15-20020a056e021d0f00b0035d6ac4a430mr23798158ila.50.1702834889916;
        Sun, 17 Dec 2023 09:41:29 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a195d00b0028b6a72dfb5sm1696815pjh.21.2023.12.17.09.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 09:41:29 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 0/2] appendix/questions: Trivial fixup
Date: Sun, 17 Dec 2023 09:41:15 -0800
Message-Id: <20231217174117.6714-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

This patchset contains trivial fixups for appendix/questions/, which
found while doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (2):
  appendix/questions/after: Use \qco{} for quoting code
  appendix/questions/after: Use \co{}

 appendix/questions/after.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.17.1

