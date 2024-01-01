Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FF7210B
	for <perfbook@vger.kernel.org>; Mon,  1 Jan 2024 01:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyG4Ajd5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d4b650bc9cso3774585ad.0
        for <perfbook@vger.kernel.org>; Sun, 31 Dec 2023 17:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704074207; x=1704679007; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yshR6O/ZZCF91BRcN9cg5GsyV2qgjZc72Up2QfO+E54=;
        b=TyG4Ajd5s5DvU2fwyHv5JR8ilL0v4Itdu9qamv7PQEKOmLjMeHg/BFkF3ko9uEM3lm
         TyvSlI9pdvLQ2sA17HzyH1MjoUNhB0HIOide/vJGOKbEf1AvtcIqphivNtroZ2jTJSXH
         RLiLGTOZY4t/xmNw5XaMCCPGyEYI47MAqlXwcObvyydHuJjGAJEwhmXrbi+lebNNOplx
         zCUICiIZ0IBvFSIFDY0l3y7cqfuIHssfJUWfEedOK+zFgOA3k2dEqp9euvecDdSJOF00
         AHwoUVsTwvdF8XHmSjZc/0qdxUorqKOcvWNsvmNif0mpTl/I24SZCmM1r1MdNUJJCl75
         U0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704074207; x=1704679007;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yshR6O/ZZCF91BRcN9cg5GsyV2qgjZc72Up2QfO+E54=;
        b=EusLzwYdX4GJ/r9BMcWQ1LhASBMLMT+oaSpO+/QDY+1dlv6VfdRZuPPyopkS5TNWxR
         jvQPc5zcVMww5YgxLvII8Bhp/JWC/e4dyvZ4OcGN5CDSpEGoulHGbhkMZ0seQZvDGG96
         f+O/3BZDiWksfoGfk40pmgq9u8xc1xHOFvPnoUCNnh0GsjvjV/2O9+Rn1KEL1M7p3M90
         Odw7iZcX8CkLWAnF80UaBgzGxZi+LVjVCHgwkCC0LcKJHlo4fJYy6mlxrR0xb7wAo+kJ
         K9riRrL3KHGembuKNl5WSTYgch6OJmqYYHwC1gzBDsLVyEtbz7wr/BlsKRwxMBUVaGHh
         nBwA==
X-Gm-Message-State: AOJu0YwH2uJVxyLqwQ/mhIPiIQCpk1F/ncDUi5cAzS+Omh0EgqwFSjPv
	YzX9zxJIFm9XGXf1mkUtX8Q=
X-Google-Smtp-Source: AGHT+IFG3FIVP7zOr2uKz1vESHgQIisvn1GXX7Aie/wFYlyZeLss0ea0dEadtoH5AXR2TcaQDZDPXQ==
X-Received: by 2002:a17:903:64f:b0:1d3:f3c1:57a5 with SMTP id kh15-20020a170903064f00b001d3f3c157a5mr15406756plb.86.1704074207037;
        Sun, 31 Dec 2023 17:56:47 -0800 (PST)
Received: from localhost.localdomain ([154.220.3.115])
        by smtp.gmail.com with ESMTPSA id y31-20020a17090a53a200b0028649b84907sm25897513pjh.16.2023.12.31.17.56.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Dec 2023 17:56:46 -0800 (PST)
From: zhouzhouyi@gmail.com
To: paulmck@kernel.org,
	akiyks@gmail.com,
	perfbook@vger.kernel.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH -perfbook V2] toolsoftrade: fix a typo: manpages should be man pages
Date: Mon,  1 Jan 2024 09:56:27 +0800
Message-Id: <1704074187-6886-1-git-send-email-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 1.7.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

According to [1][2], manpages should be man pages or man-pages.

[1] https://en.wikipedia.org/wiki/Man_page
[2] https://www.kernel.org/doc/man-pages/

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
"From:" and "Signed-off-by:" match as suggested by Akira
Thanks, Zhouyi
--
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 645ee74b..097c18d6 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -308,7 +308,7 @@ Parent process sees x=0
 	(such as \co{mmap()} and \co{shmget()}).
 	In the meantime, there are any number of textbooks that cover
 	these primitives in great detail,
-	and the truly motivated can read manpages, existing parallel
+	and the truly motivated can read man pages, existing parallel
 	applications using these primitives, as well as the
 	source code of the Linux-kernel implementations themselves.
 
-- 
2.34.1

