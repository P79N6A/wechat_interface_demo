﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class UploadJsonResult
    {

        /// <summary>
        /// 媒体文件类型，分别有图片（image）、语音（voice）、视频（video）和缩略图（thumb，主要用于视频与音乐格式的缩略图）
        /// </summary>
        public string type { get; set; }

        /// <summary>
        /// 媒体文件上传后，获取时的唯一标识
        /// </summary>
        public string media_id { get; set; }
        public string url { get; set; }
        /// <summary>
        /// 媒体文件上传时间戳
        /// </summary>
        public long created_at { get; set; }

        public int errcode { get; set; }

        public string errmsg { get; set; }
    }
}
