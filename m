Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail-pl0-f42.google.com ([209.85.160.42]:40347 "EHLO
        mail-pl0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757161AbdLWDo3 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 22 Dec 2017 22:44:29 -0500
Received: by mail-pl0-f42.google.com with SMTP id 62so12484365pld.7
        for <perfbook@vger.kernel.org>; Fri, 22 Dec 2017 19:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WXR+cku+PHTeIVc+A1g1+7BGoR6ru/2NRh9PmQHvreA=;
        b=IBf4HOps2OJLQSEvZVnsGYVRTp1iK0ykGevVzaczuH/HCByg203QkSp0qEPhl5gupY
         z/a96r3vmsgQXOBnqYlzBw5UumtKhfyT81Fi3HTcRngCV8vAhrSazcfpf8Thj6LqyFyi
         n0VbVc1v76UptQLA9qaRTP40/SVihwmVtf4W3w+f2oesWBezy63ssfl+6Emh3hutJeIO
         eZQeN4Wacdy1a7S8vvrqWxWbpflhFo3HGNltDiYXm/MxzysYBbkxsYo03sZx4XjBi/nx
         kuOtPXJalCeQeE9DDGkpi5P6308gq+ue2VRvSWZ9VXOpCDrMWQjbPGJOOjxt8b/bOCEE
         fPvA==
Subject: [PATCH 2/4] count: Get rid of ACCESS_ONCE() in text
References: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bb32ecc1-f443-96aa-3405-121be2b07bbf@gmail.com>
Date: Sat, 23 Dec 2017 12:44:26 +0900
MIME-Version: 1.0
In-Reply-To: <8134b352-67cd-2426-a3f7-ca776a3d7267@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

