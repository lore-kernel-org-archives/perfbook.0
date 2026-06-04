Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BB83A962C
	for <perfbook@vger.kernel.org>; Thu,  4 Jun 2026 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780568050; cv=none; b=mYyhvpO7iE/mGsHoa9Y7OwxVyLtdZ7lgRNJr4d2RMVhrdQVyLrGHg9m/AEtfODLwV0MlgfBq1toX/jqfjhem4riUcnhBDQ51ugn3hV72Dg1rjckkSRubnUgRQnHbYLzkC4CzXetlpjqE8sTa21qsjolgYqPamBFxD3xn+kAlp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780568050; c=relaxed/simple;
	bh=Ov31DLUlBuevviTnR6x6kMieXpjgcNrp3EyRl7XI+LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VFULpWfgj1AGEmIjoCh/5AOuaTqvjLOVLwsgJyds7Zvoe5DqqiRkNfj5kz4hlmVyBa9oP46uwXLvYSpMVqd2W+mcsD6tbDYgOqf2bx/iAaYWYITzq9YSPPqtSoZPIcqDU+kCQIHZGdFJi4bD12jLrBdWxlyhVxNRZ0B4GlduhPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRdkHukv; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRdkHukv"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so339251a91.1
        for <perfbook@vger.kernel.org>; Thu, 04 Jun 2026 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780568049; x=1781172849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbZcYAYh1mRnnJ3ycMRwlacRQCfjMRV9GV47KT1zgjM=;
        b=IRdkHukvnUjyQ5cWYXw4+ba7JJYQ+TI6wXh6yBPdPuWaK1EJk2NBD2uZtKzHBgNyd0
         F1LiqjoxFFbw6CtH6gI3FNNZmQafQ8CM9c8ipTZt4k9KFLgq8xoiq1PjdNCUX+g0Fwp2
         w94YPSzi9CWm5pXwHMOkNUiuN4RMd958yNSRqSoI+SCstbIk2uufnokMElprJ9Ltp4YL
         b8SLyyavVdXgTDIhklskI+9SOezrHVcfGqMjvPZzJY3/7eOTCD/18d2PPZRjNKPGMQ4U
         i2HxDIVMzG23td0m51qIJi0N5TsFcuLtY0/Nw1ZcbOou+unfIw7oloItontdNJwv05xr
         /ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780568049; x=1781172849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbZcYAYh1mRnnJ3ycMRwlacRQCfjMRV9GV47KT1zgjM=;
        b=gGESXUD44BZCWskr8dLCx/3fDRdMCrUtsQK1+4aXL1eLrkQM3gfWGxS0J1PV/3uMgq
         w6klMmiVvPNKUHcZBLnOeIOJ4ewondL30QUwnu+6fFsmKHzZVmF29tK5nm+ry8drVcaN
         8QzFxrANtjs0C/Ajda+QuehqdIFZA9EH0WMyhbf/OlJdEEx874qrpNVaB28TPzqjG/2I
         BJM4Ga66HRqJX4FIfTvKGCys319dhIZBzA+lZOPmLg+CjEV891RCwKD25tplP+5liyyX
         B2FClJGASZHmeqF/eo8Yz8hqKu4UU3p7fuFYSSta4QCIkIH1wz0e322XAQ5/lK4pdAKh
         cvCg==
X-Gm-Message-State: AOJu0YwvMzhXBZFM9pQYWXQHAj4cy0g6iZOdLKl0vTx1KV3vAjfHnGuX
	SrLixfw7R5V2jsmfUJbF8zLNhItgxV0IFoJMil+clIGnftK1unh+DihG
X-Gm-Gg: Acq92OF0OvRmeCssJfom+8N5/7i3bT13K6sKcSOpkLvBAPGvDa/aqLfyLanomiG7PJz
	d1t7jeoao0xlatjkhVF3bfQx8ICfc3BZUUs7UHJ5g1X8S5q4/FBPyY3bjuFBHyGXXn4JCA2E/00
	SOALlk4HUCXnoD9/iWwCRqRhsiV6tVnJvLKZMzxTAWxrM3syt80roHJiG4D1wr4C0a/hVrvrsgR
	6Kz7LFjIeTrN4USjszpaPI3u1bxnkIcvnc+RI3tjuwqSR7nKo0/BcJBV3ylla9ks9ragLVH2JEI
	PyVTxU1i6FxPYgrb6U4enEwtEzHrj2KG1Ta27dbYWuNM4wINXnQU8xuCVbxDSHiI8CIWmmMSYLi
	WpgWOz+vk1P+20NHkmFLmUKmlMVvfX0qSSzaHObVIPgD2dXd4mTbKoGsvFgAtio265ISTPQivtk
	YOLvAXpJp0ZjKF2RBiBOxDWZsCiG6NhI+pP1zJN4MbIxzb3Tb2MnM5pegMWQjMzWIZI5I1VuRrI
	BzQkzM=
X-Received: by 2002:a05:6a20:549b:b0:3b3:258f:7a1 with SMTP id adf61e73a8af0-3b4977cdff9mr7633565637.15.1780568048694;
        Thu, 04 Jun 2026 03:14:08 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm4581282a12.0.2026.06.04.03.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 03:14:08 -0700 (PDT)
Message-ID: <905601b0-385b-4ca7-8f7f-f7b9533a6a39@gmail.com>
Date: Thu, 4 Jun 2026 19:14:07 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/6] runlatex.sh: "iconv -l" rather than "iconv
 --list"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <238a898f-78dd-48ff-b2b8-996b477dbcf6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

"--list" option may not be recognized by non-GNU "iconv".
Use "-l", which should be portable (POSIX).

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Fixes: 6e2558c71bb6 ("Cope with iconv without ISO~8859-1 support")
---
 utilities/runfirstlatex.sh | 2 +-
 utilities/runlatex.sh      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index 269a3b62..6e477184 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -70,7 +70,7 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
 : ${LATEX:=pdflatex}
 : ${WARNEXIT:=1}
 
-if iconv --list | grep -q -i iso-8859-1
+if iconv -l | grep -q -i iso-8859-1
 then
 	ICONV="iconv -f ISO-8859-1 -t UTF-8"
 else
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 50aec2f9..9a060897 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -34,7 +34,7 @@
 
 WARN_REMAIN=0
 
-if iconv --list | grep -q -i iso-8859-1
+if iconv -l | grep -q -i iso-8859-1
 then
 	ICONV="iconv -f ISO-8859-1 -t UTF-8"
 else
-- 
2.43.0


