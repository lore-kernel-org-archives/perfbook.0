Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5FD7F
	for <perfbook@vger.kernel.org>; Sat, 30 Dec 2023 00:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvEOPxep"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5cdfbd4e8caso4141479a12.0
        for <perfbook@vger.kernel.org>; Fri, 29 Dec 2023 16:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703894864; x=1704499664; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLsNln/mdsUR72wfWmFJsT9aJKKwSkkfQzyTS8BIfHI=;
        b=GvEOPxepToY4Emv5PnvxXaT31lUGqy4HcX/UF+zEoejwgxeWwXXhMkzajgw0dbKEKM
         qH0MbcKVzw7n3Y4tP9KkWuGRIP0cyd6Bgzflcj2XWZ3KHrsYBDsTRB7nmTYG8pnHtIqD
         3Jxo5j5GG8au+kRuvRIJOYBX4r295bX0zN2MiNZXWwWizwTnNnLDAGMrjStqfnlBxb4o
         M0UjJhHHe6829LUY8nEmdvwHeHdyCGFj+koXQbajFnVcae9zSN2xAPRPJR24/OKKCPCc
         VNGr3O+j2GwMu1DJI3WItaZ8CdrEjA3lNbFdP76qUmddAACTa+OyLVgmSR1J3vnGIBvB
         Dt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894864; x=1704499664;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLsNln/mdsUR72wfWmFJsT9aJKKwSkkfQzyTS8BIfHI=;
        b=IiP5C5bx2dNWI5dXu9o8QW7q2fXae/GnUdAcMbQxpbggRBXbx8EWQnofdhU8eAAhPG
         kU6pQERXsR3DQDYXFk4zxSdzzyK8manqDLoUCciu+WzrnbqfD+LcxHdsP1l6rxnvxWHC
         MSRhN89K+aip3DzeFY5hAr4j9OAD0XNcnMu3PEMV8zK0ihjrQ8oY+gw8zElTdw0x+miz
         708WuWL5Qm1vPLPzYqhASH/M8zaHZxBX2kLFQEmkqvvpNeCoiRdlgOhtiR3xbhGnhqIh
         quLUk1cYT2uP17wtGrs2f2eQQoeSv3WwpWNxvYs1fjZGzkzwMb1xfU9UlwYzJmGHlDUw
         1IJA==
X-Gm-Message-State: AOJu0YyVGckBbhr6z/rECNTWovl7cDwjmWFJZMK8ek2wrEM3Jy3XLIOW
	JTQNh0r3y3fpIHPXeLc5GqF9mq2xEbU=
X-Google-Smtp-Source: AGHT+IELb2qjb//AF2nblXNHtKaCt8dQWfgpcYRs69ERiMDS08GZTJaqECwl93EZU1PyQd7eDo4xYA==
X-Received: by 2002:a05:6a20:42a2:b0:196:8707:6a45 with SMTP id o34-20020a056a2042a200b0019687076a45mr1498291pzj.111.1703894863631;
        Fri, 29 Dec 2023 16:07:43 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id p8-20020a63e648000000b00578b40a4903sm14976698pgj.22.2023.12.29.16.07.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Dec 2023 16:07:43 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook v2] cpu: make Quick Quiz 3.6 more explicit
Date: Sat, 30 Dec 2023 08:07:24 +0800
Message-Id: <1703894844-20798-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

Rewrite Quick Quiz 3.6 for clarity and explicitness, so that the
firsttime reader know that another choice is CPU 0 sharing a core
with CPU 1.

This change was identified by Chinese version editor Yunjing Li in 
the course of translating the book to Chinese.

Reported-by: Chinese version editor YunJing Li
Signed-off-by: Zhouyi Zhou<zhouzhouyi@gmail.com>
---
 cpu/overheads.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 1ee9c52f..a2ec2998 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -262,7 +262,8 @@ CAS and lock, respectively.
 \QuickQuiz{
 	\Cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	shows CPU~0 sharing a core with CPU~224.
-	Shouldn't that instead be CPU~1???
+	However, isn't it more logical for CPU 0
+	to share a core with CPU 1 instead of CPU 224???
 }\QuickQuizAnswer{
 	It is easy to be sympathetic to this view, but the file
 	\path{/sys/devices/system/cpu/cpu0/cache/index0/shared_cpu_list}
-- 
2.34.1

