Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="US++1OYS"
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8A0124
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 09:26:24 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-53fa455cd94so928018a12.2
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701537984; x=1702142784; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LT4t/dA9OL4SfmrbR/U312TNOtPoPivqVAmwetiBFQQ=;
        b=US++1OYS910AZZ/H0I9IPEdH6MPl1v/xkRAPTT3WYj3wDs3wj98zS0izXHuAsqoH54
         xUjG/6AGvQsiT/9dj8iAun3H/PUcDZESNd6Z8OBUnntiM00Jo38K87cH27HmRTM1F9Zc
         li0acEXcWS/k6uaONz7gxIQ1zHEgEoLrDA7e8sw32+LK8HEPoQeoRQ9O4tmrncK+mjfL
         zlvQvzTvt5OSENezcPNn2F3XHqG+A8twwWJqa0C0OVT9XXd6yuLwad+Yxu6bwYm/5wUG
         ZUM18lKCLAabiS0Pj2Xmpn4DcC3Im840N8sdgojgrIrtfqZ2K0kGnxS8gxw7kzZtM8nn
         PpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701537984; x=1702142784;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LT4t/dA9OL4SfmrbR/U312TNOtPoPivqVAmwetiBFQQ=;
        b=IIYqbsppVwx02PBriSh2lSHAKTHY8aC3n9qUUJZ6mDK4A0ck2htbc/9Gh3lX+bdGR9
         0rft7xpRj28psCqriQxf4Dg/QhHcMAM6sLSjfw62wkHdVtkZg1NwWlfusw4/29fEVxre
         A86tfbQJD/9de31fhnQ4vRYG2SqLVkCtFH8WDGauM092ihzYzd7LP3X0H64zBi2BHi9Q
         kiaUh/uirR4nOVDSFKwLtUxFrPacI1sQ0PTmlViXiiBPSzdUE/0FD7Ah1SzQBnCcZIpF
         OTSHtf7LC0y+QaOmmEZxvBiCI+8YTzBvK081i6HP09FT0+3VmU0Fag1oujIvePTFbU9N
         uZIg==
X-Gm-Message-State: AOJu0YzfjoqhIliGzlQ4j0v8P2qGyiaU90dhoz9oD2WxtKHGVgEKd1q7
	kKWKDY8TKNcFThz5PB3tHJqn3Yx2n4LnaA==
X-Google-Smtp-Source: AGHT+IFWOmq7pGtzWhi1ko0aROYop+7rskxVW0eG3GfauDDzGfHFxBWbk/GxxrfKbjCIY5nKXAAGVg==
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffe:1e87 with SMTP id z12-20020a1709028f8c00b001d06ffe1e87mr713294plo.106.1701537983552;
        Sat, 02 Dec 2023 09:26:23 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ea8c00b001c736b0037fsm3600714plb.231.2023.12.02.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 09:26:23 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/7] future/tm: Consistently add dash between reader and writer of reader-writer lock
Date: Sat,  2 Dec 2023 09:26:10 -0800
Message-Id: <20231202172614.20239-4-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231202172614.20239-1-sj38.park@gmail.com>
References: <20231202172614.20239-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

The text is using 'reader-writer lock' consistently, but a sentence in
tm.tex is missing the dash.  Add it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/tm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/tm.tex b/future/tm.tex
index 8b8efa98..db08bcc6 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -864,7 +864,7 @@ Here are some options available to TM:
 \item	Use TM strictly as an optimization in lock-based systems, as was
 	done by the TxLinux~\cite{ChistopherJRossbach2007a} group,
 	and as has been done by more recent work using TM to elide
-	reader writer locks~\cite{PascalFelber2016rwlockElision}.
+	reader-writer locks~\cite{PascalFelber2016rwlockElision}.
 	This approach seems sound, at least on \Power{8}
 	CPUs~\cite{Le:2015:TMS:3266491.3266500}, but leaves the locking
 	design constraints (such as the need to avoid deadlock) firmly
-- 
2.17.1

