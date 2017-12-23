Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36487 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757161AbdLWDn2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 22 Dec 2017 22:43:28 -0500
Received: by mail-pf0-f193.google.com with SMTP id p84so16020544pfd.3
        for <perfbook@vger.kernel.org>; Fri, 22 Dec 2017 19:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5cp1LgE53rUk2Qv93J46kw0PAAmVvXQ+PpsE+ndCtOI=;
        b=knRkG6bhImxkjNMaf5NcOVVNZ4I0DMEeq43kA85rlBrGuLkUdHA3TaFVG+ZbeP10CM
         VAfso17a3lViSKRKn6kVKVJHD1p5ez7F59tefnFi9/e0SLynzAmBPedZwDtBqpVJPYuA
         BIHU69H6wD2NF6Raqp6gYtaetcgD5EwHe2J9odJyFSNPLaEEAcA/IqKAPg3U5gwNeI8U
         l+dTnPUaAJu8PStcR/mbb5I4QaAe0ZhQPNcZlftPzekd8Vn3BYnzu+NUJmyfNy8SlOla
         XJfNGlppm8BqyOTRIc80ftM0aToQpcoIWFL0zJlc/RtyB/+liBQzGkp7cMCL1IELlg29
         ScjQ==
Subject: [PATCH 1/4] count: Get rid of ACCESS_ONCE() in code snippet
References: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4560eb03-aced-2336-8a33-b5691d17c803@gmail.com>
Date: Sat, 23 Dec 2017 12:43:24 +0900
MIME-Version: 1.0
In-Reply-To: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

