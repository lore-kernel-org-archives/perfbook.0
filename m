Received: from forward201c.mail.yandex.net (forward201c.mail.yandex.net [178.154.239.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E65748F
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 20:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710966705; cv=none; b=uDBEZMyArIRAH4qhjgR75SAzpecmWKhZS8nmK32qiHHLw+0ctTtVISb/j0u9JrD4sl6EQZssAba/1/yph8uze32UBifYfrz9GGfupaxyAI9Ys2udR6rdV8FsAAQLz1vO328clKeniscV3N6Mr5aSWOwV42e+JlRGhBSfpp1IVZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710966705; c=relaxed/simple;
	bh=S9mTlMllWsNdhA5Lp94RBu/WA4xrYCut4eu1NVFauWQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C7R914VKNs4hhXNPD4dapvBXUubD5TVWzmggJXlm6HHJgttdgdiujU55pQ4EiUqHhktHPiHJu0nfiSMWGVMbISUfOamJC3+O/5uFMyTl6LjSG7v7XWAlh+YwyLKXkj+onCHWS88oXXjbBqZY8G73cjQ5NC8+f2Cj30wSOUMmtn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com; spf=pass smtp.mailfrom=yandex.com; dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b=jeVVOW9f; arc=none smtp.client-ip=178.154.239.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.b="jeVVOW9f"
Received: from forward102c.mail.yandex.net (forward102c.mail.yandex.net [IPv6:2a02:6b8:c03:500:1:45:d181:d102])
	by forward201c.mail.yandex.net (Yandex) with ESMTPS id CAAA86660A
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 23:25:35 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-45.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-45.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:37a7:0:640:f7b5:0])
	by forward102c.mail.yandex.net (Yandex) with ESMTPS id 09A5360ACD
	for <perfbook@vger.kernel.org>; Wed, 20 Mar 2024 23:25:28 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-45.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id NPMwlj8oDGk0-8yZF2FED;
	Wed, 20 Mar 2024 23:25:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1710966327; bh=ZhCruDrDl45hACYO64cA9oOjxs7A0e+1RejuXe7TOps=;
	h=Message-ID:Subject:To:From:Date;
	b=jeVVOW9fhvSgvaUQzdEbFp2MCbVEAHSIUik+7r4hOZxTej9ttVtqYH496NWZecWll
	 S05dsiySh0yKu52dujIQRTNEOSW4xgzrCBP8OdjY3wFU7yr1A+w0IfONlYyCVOfqum
	 XvmY7ZYyCyFiNQSzNmo8UkMA4dlNXTMPP3KNvZUM=
Authentication-Results: mail-nwsmtp-smtp-production-main-45.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.com
Date: Wed, 20 Mar 2024 20:25:23 +0000
From: Guilherme Janczak <guilherme.janczak@yandex.com>
To: perfbook@vger.kernel.org
Subject: [PATCH] signal handlers: volatile sigatomic_t, not volatile OR
 sigatomic_t
Message-ID: <wehwhnxba7wraxuevaqvuutug4k4orzn4yxrvlm2bcva5qpax6@ctvbjzt5dlqb>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Variables shared with signal handlers must be of type `volatile
sigatomic_t`, not `volatile` or `sigatomic_t` as the current text says,
according to a C11 draft:

    When ... interrupted by ... a signal, values of objects that are
    neither lock-free atomic objects nor of type volatile sig_atomic_t
    are unspecified.

Ref: https://www.iso-9899.info/n1570.html#5.1.2.3p5
Signed-off-by: Guilherme Janczak <guilherme.janczak@yandex.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5c50d42d..873c3424 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1317,8 +1317,8 @@ from the viewpoint of the interrupted thread, at least at the
 assembly-language level.
 However, the C and C++ languages do not define the results of handlers
 and interrupted threads sharing plain variables.
-Instead, such shared variables must be \co{sig_atomic_t}, lock-free
-atomics, or \co{volatile}.
+Instead, such shared variables must be \co{volatile sig_atomic_t} or
+lock-free atomics.
 
 On the other hand, because the handler executes within the interrupted
 thread's context, the memory ordering used to synchronize communication
-- 
2.42.0

